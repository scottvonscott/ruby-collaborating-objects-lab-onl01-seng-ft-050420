require 'pry'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
     save
  end

  def save
    unless @@all.include?(name)
      @@all << self
    end
  end

  def self.all
    @@all
  end

  def add_song (song)
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
     if self.all.find {|artist|artist.name == name}
        self.all.find {|artist|artist.name == name}
     else
       artist = self.new(name)
       artist.name = name
       artist
      end
   end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
    end
    
end
