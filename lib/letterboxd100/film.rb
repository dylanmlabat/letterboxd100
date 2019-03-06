class Letterboxd100::Film
  attr_accessor :title, :position, :url, :director, :year, :length, :rating, :synopsis, :film_page
  @@all = []
  
  def initialize(title = nil, position = nil, url = nil)
    @title = title
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
  
  def film_page
    @film_page ||= Nokogiri::HTML(open(self.url))
  end
  
  def director
    director = film_page.css("span.prettify").collect do |name|
      name.text
    end
    @director ||= director.join(", ")
  end
  
  def year
    @year ||= film_page.css("small.number").css("a").text
  end
  
  def length
    @length ||= film_page.css("p.text-link.text-footer").text.gsub(/\s+/, "").chomp("MoredetailsatIMDbTMDbReportthisfilm").chop
  end
  
  def rating
    @rating ||= film_page.css("meta")[17].attribute("content").value[0..3]
  end
  
  def synopsis
    @synopsis ||= film_page.css("div.truncate").css("p").text
  end
end