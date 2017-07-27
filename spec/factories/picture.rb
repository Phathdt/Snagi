FactoryGirl.define do
  factory :picture do
  	album_id			{ 1 }
  	title 			{ Faker::Lorem.sentence(3)}
  	description { Faker::Lorem.paragraph(2)}
  	is_private  { false }
  end
end