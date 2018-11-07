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

  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(content)
    # binding.pry
    content.each do |note|
      message = Note.create(content:note)
      self.notes << message
    end
  end

  def note_contents
    contents = self.notes.collect do |note|
      note.content
    end
    contents.delete_if {|el| el == ""}
    contents
  end
end
