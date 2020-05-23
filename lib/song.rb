require 'pry'
class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize (name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    self.artist = artist
  end

  def self.new_by_filename(filename)
    song_array = filename.split(" - ")
    song_name = song_array[1]
    song = self.new(song_name)
    song.artist_name=(song_array[0])
    song.artist=(song_array[0])
    song
    end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end

end
