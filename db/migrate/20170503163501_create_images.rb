class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :user_id
      t.text :body, null: true
      t.string :image
      t.timestamps
    end
  end
end
