class AddPatientToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :patient, :boolean, default: true
  end
end
