class ChangeDataAdmissionToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :admission, :string
  end
end
