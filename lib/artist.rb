require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []


  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save  #saves the artist name to the all array
    @@all << self
  end

  def self.all #returns the @@all array
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    found_artist = self.all.find {|artist| artist.name == artist_name}
    if found_artist
      found_artist
    else
      new_artist = self.new(artist_name)
      new_artist.save
      new_artist
    end
  end

  def self.song_count
    @@song_count
  end

  def print_songs
      @songs.each do |song|
        puts song.name
      end
  end

end
