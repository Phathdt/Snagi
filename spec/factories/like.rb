FactoryGirl.define do
  factory :like do
  	user_id			{ 1 }
  	likeable_type	{ "Album"}
  	likeable_id		{ 1}
  end
end