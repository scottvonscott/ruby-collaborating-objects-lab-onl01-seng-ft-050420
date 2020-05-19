require 'pry'
class MP3Importer

  attr_accessor :path

  def initialize (path)
    @path = path
  end

  def files
    clean_array = Array.new
    Dir.glob("#{@path}/*.mp3").each do |file|
      clean_array << file.gsub("./spec/fixtures/mp3s/", "")
    end
    clean_array
    # binding.pry
  end

  def import
    self.files.each do |songs|
      Song.new_by_filename(songs)
    end
  end

end
