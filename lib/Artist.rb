class Artist

  @@all = []

  attr_accessor :name,:song

  def initialize(name)
    @name = name
    @songs = []
  end
  def genres
   self.songs.collect{|song|
      song.genre
    }.uniq
  end
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
