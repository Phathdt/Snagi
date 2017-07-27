FactoryGirl.define do
  factory :follow do
  	user_id			{ 1 }
  	followable_type	{ "Album"}
  	followable_id	{ 1}
  end
end