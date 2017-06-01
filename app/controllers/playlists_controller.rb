class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [ :show, :create, :update, :destroy ]

  def index

  end

  def show

  end
  def create

  end
  def update

  end

  def destroy

  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

end
