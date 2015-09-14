class DateChecker < ActiveModel::Validator
	def validate(record)
		if !record.visitDate.nil? && record.visitDate.past?
			record.errors[:visitDate] << "Date must not be in the past"
		end
	end
end

class Appointment < ActiveRecord::Base
	include ActiveModel::Validations
	validates_with DateChecker
	validates :visitDate, presence: true
	validates :reason, presence: true
	validates :reminderDay, presence: true
	validates :customer_id, presence: true
	validates :practitioner_id, presence: true

	belongs_to :practitioner
	belongs_to :pet
	belongs_to :customer
end
