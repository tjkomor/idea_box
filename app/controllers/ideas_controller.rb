class IdeasController < ApplicationController

  def show
    @idea = Idea.find(params[:id])
  end

  def create
    @idea = Idea.create(idea_params)
    # @idea = Idea.new(idea_params)
    redirect_to user_idea_path(@idea)
  end

  def index
    @ideas = Idea.all
  end

  def destroy
    @idea = Idea.delete(params[:id])
    redirect_to user_ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :description)
  end

end
