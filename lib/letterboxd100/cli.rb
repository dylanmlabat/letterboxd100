class Letterboxd100::CLI
  def call
    list_welcome
    Letterboxd100::Scraper.new.list_index
  end
  
  def list_welcome
    puts "Welcome to Letterboxd's Top 100 Films"
    puts "Enter the film rankings that you would like to view:"
    puts "1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, 91-100"
  end
end