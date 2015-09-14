class CreatePractitioners < ActiveRecord::Migration
  def change
    create_table :practitioners do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :school
      t.integer :schoolYears

      t.timestamps null: false
    end
  end
end
