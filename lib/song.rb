class Song 
    attr_accessor :name, :artist
    @@all =[]
    
    def initialize(name)
        @name = name
        @@all << self 
    end
    
    def self.new_by_filename(file_name)
        song_info = file_name.split("-")
        artist_name = song_info[0].strip
        song_name = song_info[1].strip
        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song
    end

    def artist=(new_artist)
        @artist = new_artist
        new_artist.songs << self
    end
    
    def artist_name=(name)
        a = Artist.find_or_create_by_name(name)
        @artist = a 
        a 
    end 

    def self.all
        @@all 
    end
end