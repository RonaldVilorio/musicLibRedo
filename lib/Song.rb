require "pry"
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

  def self.find_by_name(name)
    self.all.detect{|song|
      song.name == name
    }
  end
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  def self.new_from_filename(file)
    file = file.split(/\s*-\s*/)
    song_name = file[1]
    artist_name = file[0]
    genre_name = file[2].split(".")[0]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    song = self.new(song_name,artist,genre)
    song

  end
  def self.create_from_filename(file)
    self.new_from_filename(file).save
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
