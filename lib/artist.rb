class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = @@all.find {|a| a.name == name}
        if !artist
            artist = self.new(name)
        end
        artist
    end

    def print_songs
        @songs.each {|song| puts song.name}
    end

end