class CreateShirts < ActiveRecord::Migration[6.1]
  def change
    create_table :shirts do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image, null: false
      t.integer :price, null: false

      t.timestamps
    end
    add_index :shirts, :name
  end
end
