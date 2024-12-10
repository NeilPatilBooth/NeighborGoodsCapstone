class CreateCommunications < ActiveRecord::Migration[7.1]
  def change
    create_table :communications do |t|
      t.string :comment_body
      t.integer :author_id
      t.integer :furniture_id

      t.timestamps
    end
  end
end
