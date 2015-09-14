class Customer < ActiveRecord::Base
	validates :fname, presence: true
	validates :lname, presence: true

	has_many :appointments
	has_many :practitioners, through: :appointments
	has_many :pets
end
