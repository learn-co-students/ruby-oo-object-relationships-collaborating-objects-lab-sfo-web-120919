class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.find_or_create_by_name(artist_name)
    artist = @@all.find { |a| a.name == artist_name }
    if !artist
      artist = self.new(artist_name)
    end
    artist
  end

  def self.all
    @@all
  end

  def add_song(new_song)
    new_song.artist = self
  end

  def print_songs
    @songs.each { |song| puts song.name }
  end

  def save
    self.class.all << self
  end
end
