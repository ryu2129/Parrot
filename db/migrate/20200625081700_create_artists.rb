class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, null: false, index: true, default: ""
      t.string :image
      t.text :profile
      t.boolean :is_enabled, default: true

      t.timestamps
    end
  end
end
