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
    @playlist_skit = PlaylistSkit.new
    @skit_rating_average = rating_average(@skit)
    if current_user
    @right_playlists = filtering_playlists(current_user.playlists)
    end
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
      params.require(:skit).permit(:name, :tag_list) ## Rails 4 strong params usage
  end

  def find_next_skits(nb_of_skits)
    next_skits = RecommendedSkitsService.find(skit: @skit, user: current_user, nb_of_skits: nb_of_skits)

    if current_user && (current_playlist = current_user.current_playlist)
      all_skits_from_current_playlist = current_playlist.playlist_skits.to_a.sort_by {|playlist_skits| playlist_skits.skit_position}.map {|playlist_skits| playlist_skits.skit}
      if index_skit = all_skits_from_current_playlist.index(@skit)
        next_skits = all_skits_from_current_playlist.rotate(index_skit+1)[0..(nb_of_skits-1)]
      end
    end

    next_skits
  end

  def find_recommended_skits(nb_of_skits)
    RecommendedSkitsService.find(skit: @skit, user: current_user, nb_of_skits: nb_of_skits)
  end

  def filtering_playlists(playlists)
    right_playlists = []
    playlists.each do |playlist|
      if !playlist.skits.include?(@skit)
      right_playlists << playlist
      end
    end
    return right_playlists
  end
end
