class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :visitDate
      t.integer :reminderDay
      t.text :reason
      t.belongs_to :practitioner, index: true
      t.belongs_to :customer, index: true
      t.belongs_to :pet, index: true

      t.timestamps null: false
    end
  end
end
