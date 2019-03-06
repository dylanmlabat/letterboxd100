class Letterboxd100::CLI
  attr_accessor :set_start
  
  def call
    Letterboxd100::Scraper.new.create_list
    binding.pry
    list_welcome
    start
  end
  
  def list_welcome
    puts "~~~~~~~~~~~~~~~ Welcome to Letterboxd's Top 100 Films ~~~~~~~~~~~~~~~"
  end
  
  def start
    puts ""
    puts "Enter the film rankings that you would like to view or 'quit' to exit:"
    puts "1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, 91-100"
  
    input = gets.strip
    @set_start = input.to_i
    
    if input == "1-10" || input == "11-20" || input == "21-30" || input == "31-40" || input == "41-50" || 
      input == "51-60" || input == "61-70" || input == "71-80" || input == "81-90" || input == "91-100"
      list_set(input)
      detail_inquiry
    elsif input == "quit"
      quit
    else
      entry_error
      start
    end
  end
  
  def list_set(input)
    puts ""
    Letterboxd100::Film.all[input.to_i - 1, 10].each do |film|
      puts "#{film.position}. #{film.title}"
    end
  end
  
  def detail_inquiry
    puts ""
    puts "Enter number to read more about the film, 'back' to view another group, "
    puts "or 'quit' to exit:"
    
    input = gets.strip
    
    if input == "back"
      start
    elsif input == "quit"
      quit
    elsif input.to_i >= @set_start && input.to_i <= (@set_start + 9)
      film_data(input.to_i)
      detail_inquiry_2
    else
      entry_error
      detail_inquiry
    end
  end
  
  def detail_inquiry_2
    puts ""
    puts "Enter number to see another film, 'list' to review options, 'back' to view "
    puts "another group, or 'quit':"
    
    input = gets.strip
  
    if input == "back"
      start
    elsif input == "quit"
      quit
    elsif input == "list"
      list_set(@set_start)
      detail_inquiry
    elsif input.to_i >= @set_start && input.to_i <= (@set_start + 9)
      film_data(input.to_i)
      detail_inquiry_2
    else
      entry_error
      detail_inquiry_2
    end
  end
  
  def film_data(input)
    film = Letterboxd100::Film.all[input - 1]
    
    puts ""
    puts "~~~~~~~~ #{film.title} ~~~~~~~~"
    puts ""
    puts "Directed by:        #{film.director}"
    puts "Year of release:    #{film.year}"
    puts "Length of film:     #{film.length}"
    puts "Average rating:     #{film.rating} stars"
    puts ""
    puts "Synopsis:"
    puts "#{film.synopsis}"
    puts ""
    puts "Read more at:"
    puts "#{film.url}"
  end
  
  def entry_error
    puts ""
    puts "Invalid entry. Please try again."
  end
  
  def quit
    puts ""
    puts "Have a nice day!"
  end
end