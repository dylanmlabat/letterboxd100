class Letterboxd100::Scraper
  def list_page
    Nokogiri::HTML(open("https://letterboxd.com/visdave34/list/the-official-letterboxd-top-250-movies-updated/"))
  end
  
  def list_index
    self.list_page.css("li.poster-container.numbered-list-item")
  end
end