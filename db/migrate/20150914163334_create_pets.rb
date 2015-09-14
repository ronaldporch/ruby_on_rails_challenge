class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :animalType
      t.string :breed
      t.integer :age
      t.integer :weight
      t.datetime :lastVisit
      t.belongs_to :customer, index: true

      t.timestamps null: false
    end
  end
end
