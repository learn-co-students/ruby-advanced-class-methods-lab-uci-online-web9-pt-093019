class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    
    return song
  end
  
  
  def self.all
    @@all
  end


  def save
    self.class.all << self
  end
  
  
  def self.new_by_name(songName)
    song = self.new
    song.name = songName
    
    return song
  end
  
  
  def self.create_by_name(songName)
    song = self.new
    song.name = songName
    @@all << song
    
    return song
  end
  
  
  def self.find_by_name(songName)
    self.all.find {|song| song.name == songName}
  end
  
  def self.find_or_create_by_name(songName)
    if self.find_by_name(songName) == nil 
      self.create_by_name(songName)
    else
      self.find_by_name(songName)
    end
  end
  
  
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  
  def self.new_from_filename(songName)
    song = self.new 
    song.name = (songName.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (songName.split(" - ")[0])
    return song
  end
  
  
  def self.create_from_filename(songName)
    song = self.new 
    song.name = (songName.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (songName.split(" - ")[0])
    @@all << song
    
    return song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
