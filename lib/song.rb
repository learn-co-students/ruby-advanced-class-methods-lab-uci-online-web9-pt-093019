require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def self.create
    song = self.new
    self.all << song
    song
  end
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by {|song_instance| song_instance.name}
  end
  def self.new_from_filename(filename)
    song = self.new
    mod_name = filename.split()
    mod_name.name = mod_name
    self.all << self.save
    binding.pry
  end
  def self.create_from_filename

  end
  def self.destroy_all
    self.all.clear
  end

end
