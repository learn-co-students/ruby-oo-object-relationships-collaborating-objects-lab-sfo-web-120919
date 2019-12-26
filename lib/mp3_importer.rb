class MP3Importer
    attr_reader :path, :files
  
    def initialize(music_path)
      @path = music_path
    end
  
    def files
      file_names = Dir.entries(@path)
      file_names.select { |file_name| file_name[-3..-1] == "mp3" }
    end
  
    def import
      files.each {|file_name| Song.new_by_filename(file_name)} 
    end
  end