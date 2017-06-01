class PagesController < ApplicationController
  def home
    @recommended_skits = find_recommended_skits(6)
  end

  private

  def find_recommended_skits(nb_of_skits)
    RecommendedSkitsService.find(skit: @skit, user: current_user, nb_of_skits: nb_of_skits)
  end
end
