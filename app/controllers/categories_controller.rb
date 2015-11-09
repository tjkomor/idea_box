class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @user = current_user
    @ideas = Idea.where(user_id: current_user.id, category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to user_path(current_user)
  end

  def edit
  end

  def destroy
    Category.delete(params[:id])
    redirect_to user_path(current_user)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end




end
