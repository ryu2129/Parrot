class AddColumntwitter2ToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :provider, :string
  end
end
