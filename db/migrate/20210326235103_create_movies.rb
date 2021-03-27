class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |column|
      column.string :title
      column.integer :release_date
      column.string :director
      column.string :lead
      column.boolean :in_theaters
    end
  end
end
