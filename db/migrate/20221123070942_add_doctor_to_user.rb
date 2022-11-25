class AddDoctorToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :doctor, :boolean, default: false
  end
end
