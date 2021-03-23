class Genre

    attr_accessor :name
    
    @@all = []
    
    #has a name
    def initialize(name)
        @name = name
        @@all << self
    end
    
    #knows about all genre instances
    def self.all
        @@all
    end

    #has many songs
    #The Genre class needs an instance method, #songs, 
    #that iterates through all songs and finds the songs that belong to that genre.
    def songs
        Song.all.select do |song|
            song.genre == self
        end
    end

    #has many artists, through songs
    #The Genre class needs an instance method, #artists, 
    #that iterates over the genre's collection of songs and collects the artist that owns each song.
    def artists
        songs.collect do |song|
            song.artist
        end
    end
end
