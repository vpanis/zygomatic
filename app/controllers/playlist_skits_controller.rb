class PlaylistSkitsController < ApplicationController

  def create
    ps_params = params[:playlist_skit]["playlist_id"].select { |id| id != "" }
    ps_params.each do |playlist_id|
      @playlist_skit = PlaylistSkit.new(playlist_skit_params)
      @playlist_skit.playlist_id = playlist_id.to_i
      @skit = Skit.find(@playlist_skit.skit_id)
      @playlist = Playlist.find(playlist_id)
      @playlist_skit.save! unless @playlist.skits.include?(@skit)
    end
    redirect_to skit_path(@playlist_skit.skit), notice: "Yeah ! Le sketch a été ajouté à votre/vos playlists !"
  end

  private

  def playlist_skit_params
    params.require(:playlist_skit).permit(:skit_id, :playlist_id)
  end
end
