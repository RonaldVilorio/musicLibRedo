class Genre

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end
  def artists
    self.songs.collect{|song|
      song.artist
    }.uniq
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
    genre = Genre.new(name)
    genre.save
    genre
  end

end
