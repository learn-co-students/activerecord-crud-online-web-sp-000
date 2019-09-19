class Movie < ActiveRecord::Base
=begin
  def initialize(attr = {})
    @title = attr[title:]
    @release_date = attr[:release_date]
    @director = attr[:director]
    @lead = attr[:lead]
    @in_theaters = attr[:in_theaters]

  end
=end
end
