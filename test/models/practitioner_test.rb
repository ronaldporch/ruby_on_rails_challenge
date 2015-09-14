require 'test_helper'

class PractitionerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Doctor should not save without name" do
  	doctor = Practitioner.new(zip: 70764, schoolYears: 1)
  	assert_not doctor.save
  end

  test "Doctor should not save with name longer than 35 characters" do
  	doctor = Practitioner.new(name: "Voldemort, the one who shall not be named", schoolYears: 1)
  	assert_not doctor.save
  end

  test "Doctor should not save with a ZIP code longer than 5 digits" do
  	doctor = Practitioner.new(name: "Harold Jameson", zip: 708121234, schoolYears: 1)
  	assert_not doctor.save
  end

  test "Doctor should save with all available information" do
  	doctor = Practitioner.new(name: "Harold Jameson", address: "1234 Apple Street", city: "Anytown", state: "LA", zip: 70812, school: "Louisiana State University", schoolYears: 1)
  	assert doctor.save
  end

  test "Doctor should save with only a name and years of schooling" do
  	doctor = Practitioner.new(name: "Harold Jameson", schoolYears: 1)
  	assert doctor.save
  end
end