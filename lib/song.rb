require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  this_song = self.new
  this_song.save
  return this_song
  end

def self.new_by_name(name)
  new_song = self.create
  new_song.name = name
  return new_song
end

def self.create_by_name(name)
new_song = self.new_by_name(name)
new_song.save
return new_song
end

def self.find_by_name(name_string)
  @@all.each do |song_instance|
    if song_instance.name == name_string
      return song_instance
    end # end of if

  end#end of each
  return nil
end#end of method

def self.find_or_create_by_name(name_string)
  match = self.find_by_name(name_string)
if match !=nil
  return match
else
  match = self.create_by_name(name_string)
end #end of if

end #end of method

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical

  new_array =  @@all.sort do  |instance_element1, instance_element2|
    instance_element1.name <=> instance_element2.name
end #end of sort block

# new array is sorted but has duplicates for some reason
# ergo -> delete all duplicates

  duplicate_check_array = []

  new_array.each do |song_instance|
if duplicate_check_array.include?(song_instance) == false
  duplicate_check_array << song_instance  # only add unique songs to to array
  end #end of if
end #end of each block

 return duplicate_check_array

  end #end of alphabetical method

def self.new_from_filename(filename)
  new_song = self.create  #instantiate a song instance

  array = filename.split(" - ") #split filename
  new_song.artist_name = array[0] #assign artist_name

  new_song.name = array[1].split(".")[0] #split file extention
  #array[1] is name with file extention
  #split at the "." then return only the name

  return new_song
end #end of method

def self.create_from_filename(filename)
new_song = self.new_from_filename(filename)
new_song.save
end # end of method

def self.destroy_all
@@all.delete_if {|song| song.class == Song}
end #end of method

end #end of Song class
