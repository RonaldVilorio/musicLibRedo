class Artist

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
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
