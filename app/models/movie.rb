class Movie < ActiveRecord::Base
  attr_accessor :title, :release_date, :in_theaters, :lead, :director
  belongs_to :Director
  belongs_to :Lead 
  
  def initialize(title, release_date=nil, lead=nil, director=nil)
    @title = title
    @release_date = release_date
    @lead = lead
    @director = director 
  end 
  
  # def save
  # sql = <<-SQL 
  # INSERT INTO movies(title, release_date, director, lead, in_theaters) VALUES(?,?,?,?,?)
  # SQL
  # DB[:conn].execute(sql, self.title, self.release_date, self.director, self.lead, self.in_theaters)
  # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM movies")[0][0]
  # end 
  
  # def self.create(name,release_date=nil, director=nil, lead=nil, in_theaters)
  #   name = Movie.new(name, release_date, director, lead, in_theaters)
  #   name.save 
  #   name
  # end 
  
  def in_theaters?
  end 
  
  # def drop_table(name)
  #   sql = <<-SQL 
  #   DROP TABLE "#{name}"
  #   SQL
  #   DB[:conn].execute(sql)
  # end 

end