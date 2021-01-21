class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |c|
      c.string :title
      c.boolean :in_theaters
      c.integer :release_date
      c.string :director
      c.string :lead
  end
end
end