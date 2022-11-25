class AddUserToClinic < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :user_id, :integer
  end
end
