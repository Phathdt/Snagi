FactoryGirl.define do
  factory :album do
  	user_id			{ 1 }
  	title 			{ Faker::Lorem.sentence(3)}
  	description { Faker::Lorem.paragraph(2)}
  	quality  		{ 0 }
  	is_private  { false }
  end
end