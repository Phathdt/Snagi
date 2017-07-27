FactoryGirl.define do
  factory :notification do
  	user_id			{ 1 }
  	content			{ Faker::Lorem.sentence(1) }
  	user_has_id	{ 1 }
  	object_id 	{ 1 }
  	is_readed 	{ false }
  end
end