class Letterboxd100::Film
  attr_accessor :title, :position, :url, :director, :year, :rating, :synopsis
  @@all = []
  
  def initialize(name = nil, position = nil, url = nil)
    @name = name
    @position = position
    @url = url
    @@all << self
  end
end