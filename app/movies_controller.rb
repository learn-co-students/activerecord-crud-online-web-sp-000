require 'pry'

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

# ERROR #1  
#(title = "Home Alone", release_date = 1990, director = "Michael Mann", lead = "Al Pacino, Robert De Niro, and Val Kilmer", in_theaters = false)

def can_be_created_in_a_block(attributes = nil, &block)
  Movie.create do |m|
    m.title = "Home Alone"
    m.release_date = 1990
    m.director = "Michael Mann"
    m.lead = "Al Pacino"
    m.in_theaters = false
  end
end

def can_get_the_first_item_in_the_database
  Movie.first
end

def can_get_the_last_item_in_the_database
  Movie.last
end

def can_get_size_of_the_database
  Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.first
end

def can_find_by_multiple_attributes
  Movie.find_by(title: "Title", release_date: 2000, director: "Me")
end

def can_find_using_where_clause_and_be_sorted
  Movie.where("release_date > ?", 2002).order(release_date: :desc)
end

def can_be_found_updated_and_saved
  Movie.create(title: "Awesome Flick")
  Movie.update(:title => "Even Awesomer Flick")
end

def can_update_using_update_method
  Movie.create(title: "Wat?")
  Movie.update(:title => "Wat, huh?")
end

def can_update_multiple_items_at_once
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update(:title => "A Movie")
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.where(title: "That One Where the Guy Kicks Another Guy Once").destroy_all
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all
end