class DeleteTimestamps < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :timestamps 
  end
end
