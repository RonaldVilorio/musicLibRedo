class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist,:genre

  def initialize(name,artist = nil,genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    @genre.songs << self if !@genre.songs.include?(self)
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
   song = Song.new(name)
   song.save
   song
  end

end
