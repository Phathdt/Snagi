FactoryGirl.define do
	require 'securerandom'
  factory :user do
    name        { Faker::Name.name }
    email       { Faker::Internet.email }
    password		{ SecureRandom.base64(15) } 
  end
end