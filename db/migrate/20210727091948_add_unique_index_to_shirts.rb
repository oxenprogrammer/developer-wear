class AddUniqueIndexToShirts < ActiveRecord::Migration[6.1]
  def change
    remove_index :shirts, :name
    add_index :shirts, :name, unique: true
  end
end
