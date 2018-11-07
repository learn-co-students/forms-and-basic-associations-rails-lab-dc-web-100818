class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist_id?
      self.artist.name
    else
      nil
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    if self.genre_id?
      self.genre.name
    else
      nil
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      note = Note.create(content: note)
      self.notes << note
    end
  end

  def note_contents
    notes = self.notes.collect do |note|
        note.content
    end
    notes.select { |n| n != "" }
  end
end
