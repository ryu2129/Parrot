class AddColumntwitterToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :uid, :string
    add_column :members, :nickname, :string
  end
end
