class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name) #setter or writer
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name #getter or reader
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name) #setter or writer
    self.genre = Genre.find_by(name: name)
  end

  def genre_name   #getter or reader
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
      new_note = Note.new(content: content)
      self.notes << new_note
      end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  # def note_content=(content) #setter or writer
  #   self.note = Note.create(content: content)
  # end
  #
  # def note_content #getter or reader
  #   self.note ? self.note.content : nil
  # end
end
