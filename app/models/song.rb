class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    def artist_name=(name)
        self.artist = Artist.find_or_create_by(name: name)
    end

    def artist_name
        self.artist ? self.artist.name : nil
    end

    def genre_name=(genre)
        self.genre = Genre.find_by(name: genre)
    end

    def genre_name
        self.genre ? self.genre.name : nil
    end

    def note_contents=(notes)
        notes.each do |note|
            if !note.empty?
                new_note = Note.create(song_id: self.id, content: note)
                self.notes << new_note
            end
        end
    end

    def note_contents
        self.notes.map{ |note| note.content }
    end
end
