class Movie < ActiveRecord::Base
  attr_accessor :title, :release_date, :director, :lead, :in_theaters
end
