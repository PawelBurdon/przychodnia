class AddStatusToClinic < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :status, :boolean, default: false
  end
end
