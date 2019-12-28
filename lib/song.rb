# require 'pry'

class Song 
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @artist 
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.new_by_filename(filename)
        song_artist = filename.split(" - ")[0].strip
        song_title = filename.split(" - ")[1].strip
        song = self.new(song_title)
        song.artist = Artist.find_or_create_by_name(song_artist)
        song
    end

    def artist_name=(name)
        if self.artist.nil?
            self.artist = Artist.find_or_create_by_name(name)
        else
            self.artist.name = name
        end
    end

end


   

   
