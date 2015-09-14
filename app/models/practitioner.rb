class Practitioner < ActiveRecord::Base
	validates :name, presence: true
	validates :name, length: {maximum: 35}
	validates :zip, length: {maximum: 5}
	validates :schoolYears, numericality: {greater_than: 0, less_than_or_equal_to: 100}

	has_many :appointments
	has_many :customers, through: :appointments
end
