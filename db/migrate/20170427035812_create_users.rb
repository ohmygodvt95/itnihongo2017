class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar
      t.string :cover
      t.datetime :birthday
      t.timestamps
    end
  end
end
