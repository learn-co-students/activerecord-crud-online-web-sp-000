class CreateMovies < ActiveRecord::Migration[4.2]
  def change
    create_table :movies do |ct|
      ct.string :title
      ct.integer :release_date
      ct.string :director
      ct.string :lead
      ct.boolean :in_theaters
    end
  end
end