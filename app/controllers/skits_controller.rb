class SkitsController < ApplicationController
  before_action :set_skit, only: [:show]

  def index
    @review = Review.new
  end

  def show
    @recommended_skits = find_recommended_skits(6)
  end

  private

  def set_skit
    @skit = Skit.find(params[:id])
  end

  def skit_params
      params.require(:skit).permit(:name, :tag_list´) ## Rails 4 strong params usage
  end

  def find_recommended_skits(nb_of_skits)
    RecommendedSkitsService.find(skit: @skit, user: current_user, nb_of_skits: nb_of_skits)
  end
end
