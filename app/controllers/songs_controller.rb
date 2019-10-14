class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        song = Song.create(song_params)
   
        redirect_to song_path(song)
    end

    def show
        @song = Song.find(params[:id])
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :genre_name, note_contents: [])
    end
end
