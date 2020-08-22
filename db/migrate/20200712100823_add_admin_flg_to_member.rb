class AddAdminFlgToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :admin_flg, :boolean
  end
end
