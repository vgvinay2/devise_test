require 'faker'

FactoryGirl.define do
    # Define a basic devise user.
    # factory :user do
    #     email "example@example.com"
    #     password "example"
    #     password_confirmation "example"
    # end

    factory :user do |f|
	    f.first_name { Faker::Name.first_name }
	    f.last_name  { Faker::Name.last_name }
	    f.email { Faker::Internet.email }
	    f.password  { "password" } #{ Faker::Internet.password }
	    f.password_confirmation  { "password" }
	 
    end

    factory :invalid_user  do |f|
       f.email nil
    end
end