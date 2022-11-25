class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :visits, :doctor_id, :clinic_id
  end
end
