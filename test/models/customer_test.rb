require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Customer should not save without last name" do
  	customer = Customer.new(fname: "Ronald")
  	assert_not customer.save
  end

  test "Customer should not save without first name" do
  	customer = Customer.new(lname: "Porch")
  	assert_not customer.save
  end

  test "Customer should save if first name and last name are given" do
  	customer = Customer.new(fname: "Ronald", lname: "Porch")
  	assert customer.save
  end
end
