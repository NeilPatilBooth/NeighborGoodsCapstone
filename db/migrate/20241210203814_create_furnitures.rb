class CreateFurnitures < ActiveRecord::Migration[7.1]
  def change
    create_table :furnitures do |t|
      t.string :furniture_name
      t.string :furniture_image
      t.string :furniture_description
      t.integer :owner_id
      t.datetime :rent_start
      t.datetime :rent_end
      t.integer :borrower_id
      t.integer :comments_count

      t.timestamps
    end
  end
end
