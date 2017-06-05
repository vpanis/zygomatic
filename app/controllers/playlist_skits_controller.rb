class PlaylistSkitsController < ApplicationController

  def create
    @playlist_names = []
    ps_params = params[:playlist_skit]["playlist_id"].select { |id| id != "" }
    ps_params.each do |playlist_id|
      @playlist_skit = PlaylistSkit.new(playlist_skit_params)
      @playlist_skit.playlist_id = playlist_id.to_i
      @skit = Skit.find(@playlist_skit.skit_id)
      @playlist = Playlist.find(playlist_id)
      unless @playlist.skits.include?(@skit)
        @playlist_skit.save!
        @playlist_names << @playlist.name
      end
    end
    redirect_to skit_path(@playlist_skit.skit), notice: noticing(@playlist_names)
  end

  private

  def playlist_skit_params
    params.require(:playlist_skit).permit(:skit_id, :playlist_id)
  end

  def noticing(playlist_names)
    s = "Ce sketch a été ajouté à la playlist : "
    playlist_names.each do |name|
      s += " || #{name} || "
    end
    return s + "."
  end

end
