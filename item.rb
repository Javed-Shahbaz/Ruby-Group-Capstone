require_relative 'genre'
require_relative 'author'
require_relative 'source'
require_relative 'label'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date
  attr_accessor :archived

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    (Time.now - @publish_date) >= (10 * 365 * 24 * 60 * 60) # ten years (seconds)
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been archived.'
    else
      puts 'Item cannot be archived yet.'
    end
  end
end
