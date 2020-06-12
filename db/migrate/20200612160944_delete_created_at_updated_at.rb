class DeleteCreatedAtUpdatedAt < ActiveRecord::Migration[5.1]
 def change
    remove_column :movies, :created_at
    remove_column :movies, :updated_at
  end
end
