class IdeasController < ApplicationController

  def show
    # @idea = Idea.create(name: 'keep slota wild', description: "do it")
  end

  def create
    # byebug
    # @idea = Idea.new(idea_params)
    redirect_to idea_path
  end

  def index
  end

  # private
  #
  # def idea_params
  #   params.require(:idea).permit(:username, :password)
  # end

end