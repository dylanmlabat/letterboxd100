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
    puts "Enter the film rankings that you would like to view:"
    puts "1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, 91-100"
  
    input = gets.strip.to_i
    
    if input == 1 || input == 11 || input == 21 || input == 31 || input == 41 || 
      input == 51 || input == 61 || input == 71 || input == 81 || input == 91
      list_set(input)
    else
      puts "Invalid entry. Please try again."
      start
    end
  end
  
  def list_set(input)
    Letterboxd100::Film.all[input - 1, 10].each do |film|
      puts "#{film.position}. #{film.title}"
    end
  end
end