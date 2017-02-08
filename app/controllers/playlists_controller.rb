class PlaylistsController < ApplicationController
  before_action :set_songs, only: [:new, :edit]
  before_action :set_playlist, only: [:show, :edit, :update]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new

  end

  def create
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to playlist_path(@playlist)
    else
      redirect_to new_playlist_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @playlist.update_attributes(playlist_params)
    redirect_to playlist_path(@playlist)
  end
private

  def set_songs
    @songs = Song.all
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, song_ids:[])
  end
end
