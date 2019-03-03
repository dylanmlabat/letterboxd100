class Letterboxd100::Film
  attr_accessor :title, :position, :url, :director, :year, :rating, :synopsis
  @@all = []
  
  def initialize(name = nil, position = nil, url = nil)
    @name = name
    @position = position
    @url = url
    @@all << self
  end
  
  def self.films_from_index(film)
    self.new(
      film.css("div").css("img").attribute("alt").value,
      film.css("p").text,
      "https://letterboxd.com#{film.css("div").attribute("data-film-slug").value}"
      )
  end
  
  def self.all
    @@all
  end
end