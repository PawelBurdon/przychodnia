class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.text :description
      t.datetime :data
      t.integer :doctor_id
      t.integer :user_id
      t.timestamps
    end
  end
end
