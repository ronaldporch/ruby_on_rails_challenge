class Pet < ActiveRecord::Base
	validates :name, :age, :breed, :weight, :lastVisit, presence: true
	validates :name, length: {maximum: 35}
	validates :animalType, numericality: {greater_than: 0, less_than_or_equal_to: 3}
	validates :breed, length: {maximum: 35}
	validates :customer_id, presence: true

	belongs_to :customer
	has_many :appointments
end