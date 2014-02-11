FactoryGirl.define do

	factory :github_user do
		sequence(:name) { |n| "github_user_#{n}" } #required
	end

end