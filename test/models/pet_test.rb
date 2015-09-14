require 'test_helper'

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Pet should not save with no name" do
  	pet = Pet.new(animalType: 1, breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.today())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with no animal type" do
  	pet = Pet.new(name: "Sparkles", breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.today())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with no breed" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, age: 25, weight: 150, lastVisit: Date.today())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with no age" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, breed: "Chihuahua", weight: 150, lastVisit: Date.today())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with no weight" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, breed: "Chihuahua", age: 25, lastVisit: Date.today())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with no date of last visit" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, breed: "Chihuahua", age: 25, weight: 150)
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with animalType less than 1" do
  	pet = Pet.new(name: "Sparkles", animalType: 0, breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.yesterday())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with animalType greater than 3" do
  	pet = Pet.new(name: "Sparkles", animalType: 4, breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.yesterday())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with name being longer than 35 characters" do
  	pet = Pet.new(name: "Gimli, son of Gloin, Respected Dwarf Lord of Middle Earth", animalType: 4, breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.yesterday())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with Breed being longer than 35 characters" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, breed: "Long-tailed Hippogriff, found generally in Harry Potter movies", age: 25, weight: 150, lastVisit: Date.yesterday())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert_not pet.save
  end

  test "Pet should not save with no owner" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.yesterday())
  	assert_not pet.save
  end

  test "Pet should save" do
  	pet = Pet.new(name: "Sparkles", animalType: 1, breed: "Chihuahua", age: 25, weight: 150, lastVisit: Date.yesterday())
  	pet.customer = Customer.find_by_fname("Ronald")
  	assert pet.save
  end
end
