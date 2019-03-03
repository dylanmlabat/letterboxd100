class Letterboxd100::Scraper
  def list_page
    Nokogiri::HTML(open("https://letterboxd.com/visdave34/list/the-official-letterboxd-top-250-movies-updated/"))
  end
  
  def list_index
    list_page.css("li.poster-container.numbered-list-item")
  end
  
  def create_list
    list_index.each do |film|
      Letterboxd100::Film.films_from_index(film)
    end
  end
end