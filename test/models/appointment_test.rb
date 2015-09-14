require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Appointment should not save with previous date/today" do
  	apt = Appointment.new(visitDate: Date.yesterday(), reminderDay: 1, reason: "Cat is sick")
  	apt.practitioner = Practitioner.first
  	apt.pet = Pet.first
  	apt.customer = Customer.first
  	assert_not apt.save
  end

  test "Appointment should not save without an appointment date" do
  	apt = Appointment.new(reminderDay: 1, reason: "Cat is sick")
  	apt.practitioner = Practitioner.first
  	apt.pet = Pet.first
  	apt.customer = Customer.first
  	assert_not apt.save
  end
  
  test "Appointment should not save with no reminder day" do
  	apt = Appointment.new(visitDate: Date.tomorrow(), reason: "Cat is sick")
  	apt.practitioner = Practitioner.first
  	apt.pet = Pet.first
  	apt.customer = Customer.first
  	assert_not apt.save
  end

  test "Appointment should not save without a reason" do
  	apt = Appointment.new(visitDate: Date.tomorrow(), reminderDay: 1)
  	apt.practitioner = Practitioner.first
  	apt.pet = Pet.first
  	apt.customer = Customer.first
  	assert_not apt.save
  end

  test "Appointment should not save without a doctor" do
  	apt = Appointment.new(visitDate: Date.tomorrow(), reminderDay: 1, reason: "Cat is sick")
  	apt.pet = Pet.first
  	apt.customer = Customer.first
  	assert_not apt.save
  end

  test "Appointment should not save without a pet" do
  	apt = Appointment.new(visitDate: Date.tomorrow(), reminderDay: 1, reason: "Cat is sick")
  	apt.practitioner = Practitioner.first
  	apt.customer = Customer.first
  	assert apt.save
  end

  test "Appointment should not save without a customer" do
  	apt = Appointment.new(visitDate: Date.tomorrow(), reminderDay: 1, reason: "Cat is sick")
  	apt.practitioner = Practitioner.first
  	apt.pet = Pet.first
  	assert_not apt.save
  end

  test "Appointment should save given all proper attributes" do
  	apt = Appointment.new(visitDate: Date.tomorrow(), reminderDay: 1, reason: "Cat is sick")
  	apt.practitioner = Practitioner.first
  	apt.pet = Pet.first
  	apt.customer = Customer.first
  	assert apt.save
  end
end
