class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :member_id
      t.integer :post_id

      t.timestamps
    end
  end
end
