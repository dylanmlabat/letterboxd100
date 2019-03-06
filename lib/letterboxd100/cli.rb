class Letterboxd100::CLI
  def call
    Letterboxd100::Scraper.new.create_list
    list_welcome
    start
  end
  
  def list_welcome
    puts "~~~~~~~~~~~~~~~ Welcome to Letterboxd's Top 100 Films ~~~~~~~~~~~~~~~"
    puts ""
  end
  
  def start
    puts "Enter the film rankings that you would like to view or 'q' to quit:"
    puts "1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, 91-100"
  
    input = gets.strip
    
    if input == "1-10" || input == "11-20" || input == "21-30" || input == "31-40" || input == "41-50" || 
      input == "51-60" || input == "61-70" || input == "71-80" || input == "81-90" || input == "91-100"
      list_set(input)
    elsif input == "q"
      quit
    else
      puts "Invalid entry. Please try again."
      start
    end
  end
  
  def list_set(input)
    Letterboxd100::Film.all[input.to_i - 1, 10].each do |film|
      puts "#{film.position}. #{film.title}"
    end
  end
  
  def quit
    puts "Have a nice day!"
  end
end