# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block(args = {title: "Home Alone", release_date: 1990})
  # If no arguments are passed, use default values:
  # title == "Home Alone"
  # release_date == 1990
  
  Movie.create do |m|
    m.title = args[:title]
    m.release_date = args[:release_date]
  end
end

def can_get_the_first_item_in_the_database
  Movie.find_by(id: 1)
end

def can_get_the_last_item_in_the_database
  Movie.all[-1]
end

def can_get_size_of_the_database
  sql = <<-SQL 
  SELECT COUNT(id) FROM movies
  SQL

  ActiveRecord::Base.connection.execute(sql)[0][0]

end

def can_find_the_first_item_from_the_database_using_id
  sql = <<-SQL 
  SELECT * FROM movies WHERE id = 1
  SQL

  Movie.find_by_id(ActiveRecord::Base.connection.execute(sql)[0][0])

end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  sql = <<-SQL
  SELECT * FROM movies WHERE title = "Title" AND release_date = 2000 AND director = "Me"
  SQL

  Movie.find_by_id(ActiveRecord::Base.connection.execute(sql)[0][0])

end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by 
  # release date descending
  sql = <<-SQL 
  SELECT * FROM movies WHERE release_date > 2002 ORDER BY release_date DESC
  SQL
  
  ActiveRecord::Base.connection.execute(sql).map {|movie| Movie.find_by_id(movie[0])}
  
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  id = Movie.find_by(title: "Awesome Flick").id
  Movie.update(id, title: "Even Awesomer Flick")
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  id = Movie.find_by(title: "Wat?").id
  Movie.update(id, title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.update(title: "A Movie")
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.delete(Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once").id)
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.delete_all
end