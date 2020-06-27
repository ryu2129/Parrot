class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :member, foreign_key: true
      t.references :artist, foreign_key: true
      t.string :title
      t.text :introduction
      t.string :image
      t.datetime :schedule
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :watching_method, null: false, default: 1
      t.string :detailed_url
      t.integer :admission

      t.timestamps
    end
  end
end
