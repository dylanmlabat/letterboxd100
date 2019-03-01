class Letterboxd100::Film
  attr_accessor :name, :director, :year, :rating
  
  def self.current
    film1 = self.new
    film1.name = "The Godfather"
    film1.director = "Francis Ford Coppola"
    film1.year = "1972"
    film1.rating = "4.55"
    
    [film1]
  end
end