require 'pry'

class MP3Importer
    attr_accessor :path, :files

    def initialize(path)
        @path = path
    end

    def files
        # song = self.new
        # song.title = filename.split(" - ")[1]
        # song 
        ## Song.new_by_filename(filename)
        filenames = Dir.entries(@path)
        # file_names.collect do |file|
        #     file.split(/-./)
        #     self.artist = file[0].strip
        #     self.title = file[1].strip
        # end
        filenames.select {|filename| filename[-3..-1] == "mp3"}
        # binding.pry 
    end

    # def self.new_by_filename(filename)
    #     song_artist = filename.split(" - ")[0].strip
    #     song_title = filename.split(" - ")[1].strip
    #     song = self.new(song_title)
    #     song.artist = Artist.find_or_create_by_name(song_artist)
    #     song
    # end

    def import
        files.collect {|filename| Song.new_by_filename(filename)}
    end

end