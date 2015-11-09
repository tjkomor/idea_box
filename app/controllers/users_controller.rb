class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @ideas = Idea.where(@user.id)
    @categories = Category.all
  end

end
