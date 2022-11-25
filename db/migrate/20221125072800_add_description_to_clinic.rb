class AddDescriptionToClinic < ActiveRecord::Migration[5.2]
  def change
    add_column :clinics, :description, :text, default: ""
  end
end
