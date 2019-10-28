require 'pry'
class Song
  attr_accessor :name, :artist_name
    @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song_element| song_element.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort{|song_element1, song_element2| song_element1.name <=> song_element2.name}
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/[-.]|\./)
    song = self.new
    song.name = filename_array[1].lstrip
    song.artist_name = filename_array[0].rstrip
    song
  end

  def self.create_from_filename(filename)
    #new_from_filename(filename) #=> unable to get this to work - why won't the local variable song work?

    filename_array = filename.split(/[-.]|\./)
    song = self.new
    song.name = filename_array[1].lstrip
    song.artist_name = filename_array[0].rstrip
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
