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

#----------------------------------#

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
    @@all.each do |song|
      if song.name == name
      return song
      end
    end
    nil
  end


  def self.find_or_create_by_name(name)
    if find_by_name(name) == name
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    alphabetized = @@all.sort_by{|word| word.length}
    return alphabetized
  end

  def self.new_from_filename(file)
    song = self.new
    new_file = file.chomp(".mp3")
    new_file.split("-")
    song.name = new_file[0]
    song.artist_name = new_file[1]
    song
  end

  def self.create_from_filename(file)
    song = self.new
    new_file = file.chomp(".mp3")
    new_file.split(" - ")
    song.name = new_file[0]
    song.artist_name = new_file[1]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end


end
