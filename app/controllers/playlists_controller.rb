class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [ :show, :create, :update, :destroy ]
  before_action :set_launch, only: [ :launch ]

  def index
  end

  def show
    @playlist_skits = @playlist.playlist_skits.to_a.sort_by {|playlist_skits| playlist_skits.skit_position}.map {|playlist_skits| playlist_skits.skit}
    respond_to do |format|
      format.html { render 'show' }
      format.js  # <-- will render `app/views/skits/index.js.erb`
    end
  end
  def create

  end
  def update

  end

  def destroy

  end

  def launch
    current_user.update(current_playlist: @playlist)
    redirect_to skit_path(@skit)
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def set_launch
    @playlist = Playlist.find(params[:playlist_id])
    @skit = Skit.find(params[:id])
  end

end
