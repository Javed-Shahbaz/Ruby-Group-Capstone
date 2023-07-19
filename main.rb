require_relative 'app'

class Main
  def initialize
    @app = App.new(self)
    puts ''
    puts '-----------------------------'
    puts 'Catalog of Things Application'
    puts '-----------------------------'
    @app.load_data
    display_menu
  end

  def display_menu
    loop do
      puts ''
      puts 'Please choose an option by entering a number:'
      puts ''
      puts '1. List all books'
      puts '2. List all music albums'
      puts '3. List all games'
      puts '4. List all genres'
      puts '5. List all labels'
      puts '6. List all authors'
      puts '7. Add a book'
      puts '8. Add a music album'
      puts '9. Add a game'
      puts '10. Exit'
      puts
      choice = gets.chomp
      option_selected(choice)
    end
  end

  def option_selected(choice)
    options = {
      '1' => :list_books,
      '2' => :list_music_albums,
      '3' => :list_games,
      '4' => :list_genres,
      '5' => :list_labels,
      '6' => :list_authors,
      '7' => :add_book,
      '8' => :add_music_album,
      '9' => :add_game,
      '10' => :quit
    }

    method = options[choice]
    if method.nil?
      puts 'Invalid! Enter a Valid Option.'
      display_menu
    else
      @app.send(method)
    end
  end
end

Main.new
