class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre
    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre
    artist_array = self.songs.map do |song|
      song.artist
    end
    artist_array.uniq.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name
    artist_names_array = self.songs.map do |song|
      song.artist.name
    end
    artist_names_array.uniq
  end
end
