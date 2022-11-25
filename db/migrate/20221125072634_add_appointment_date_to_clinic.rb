class AddAppointmentDateToClinic < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :appointment_date, :datetime, :default => DateTime.now
  end
end
