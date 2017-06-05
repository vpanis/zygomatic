class SkitsController < ApplicationController
  before_action :set_skit, only: [:show]

  def index
    if params[:search]
      @skits = Skit.search(params[:search])
      @comedians = []
      @skits.each do |skit|
        @comedians << skit.comedian
      end
      @comedians.uniq!
      # @playlists = []
      # @skits.each do |playlist|
      #   @playlists << skit.playlist
      # end
      # @playlists.uniq!
    else
      @skits = nil
    end

    respond_to do |format|
      format.html { render 'skits/index' }
      format.js  # <-- will render `app/views/skits/index.js.erb`
    end
  end

  def show
    @next_skits = find_next_skits(6)
    @recommended_skits = find_recommended_skits(6)
    @skit = Skit.find(params[:id])
    @review = Review.new
    @skit_rating_average = rating_average(@skit)
  end

  def rating_average(skit)
    ratings = []
    skit.reviews.each do |review|
      ratings << review.rating
    end
    return ratings.inject{ |sum, rate| sum + rate }.to_f / ratings.length
  end

  private

  def set_skit
    @skit = Skit.find(params[:id])
  end

  def skit_params
      params.require(:skit).permit(:name, :tag_list´) ## Rails 4 strong params usage
  end

  def find_next_skits(nb_of_skits)
    next_skits = RecommendedSkitsService.find(skit: @skit, user: current_user, nb_of_skits: nb_of_skits)

    if current_playlist = current_user.current_playlist
      all_skits_from_current_playlist = current_playlist.skits.to_a
      if index_skit = all_skits_from_current_playlist.index(@skit)
        next_skits = all_skits_from_current_playlist[(index_skit+1)..(index_skit+1+nb_of_skits)]
      end
    end

    next_skits
  end

  def find_recommended_skits(nb_of_skits)
    RecommendedSkitsService.find(skit: @skit, user: current_user, nb_of_skits: nb_of_skits)
  end

end
