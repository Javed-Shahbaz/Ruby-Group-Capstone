require_relative 'item'

def create_sample_data
  genre = Genre.new(1, 'Fantasy')
  author = Author.new(1, 'J.K.', 'Rowling')
  source = Source.new(1, 'Publisher X')
  label = Label.new(1, 'Harry Potter', 'Red')
  publish_date = Time.now - (9 * 365 * 24 * 60 * 60) # Compare date in years (seconds)

  item = Item.new(1, genre, author, source, label, publish_date)
  genre.add_item(item)
  author.add_item(item)
  source.add_item(item)
  label.add_item(item)

  item
end

def main_menu
  puts "\nOptions:"
  puts '1. View Item Details'
  puts '2. Archive Item'
  puts '3. Quit'
  print 'Enter your choice: '
end

def view_item_details(item)
  puts "\nItem Details:"
  puts "ID: #{item.id}"
  puts "Genre: #{item.genre.name}"
  puts "Author: #{item.author.first_name} #{item.author.last_name}"
  puts "Source: #{item.source.name}"
  puts "Label: #{item.label.title}"
  puts "Publish Date: #{item.publish_date}"
  puts "Archived: #{item.archived}"
end

def archive_item(item)
  item.move_to_archive
end

# Main app loop
item = create_sample_data

loop do
  main_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    view_item_details(item)
  when 2
    archive_item(item)
  when 3
    puts 'See you soon!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
