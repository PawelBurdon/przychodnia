class CreateClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :clinics do |t|
      t.integer :number
      t.string :clinic_type
      t.integer :doctor_id
      t.date :data

      t.timestamps
    end
  end
end
