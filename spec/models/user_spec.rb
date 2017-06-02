require "rails_helper"

RSpec.describe User, :type => :model do
#handle Email all ready taken active record validation error
 # it "User by last name" do
 #    lindeman = User.create!(first_name: "Andy", last_name: "Lindeman",email: "xyz@.com", password: "qazplm123")
 #    chelimsky = User.create!(first_name: "David", last_name: "Chelimsky",email: "xyz@.com", password: "qazplm123")
 #    byebug
 #    expect(chelimsky).to have_content 'Email has already been taken'
 #  end

  it "User Cretaed" do
    lindeman = User.create!(first_name: "Andy", last_name: "Lindeman",email: "xyz@.com", password: "qazplm123")
    chelimsky = User.create!(first_name: "David", last_name: "Chelimsky",email: "xy2z@.com", password: "qazplm123")
    expect(User.last).to eq(chelimsky)
  end


  it "has a valid user without first_name and last_name" do
  	user = FactoryGirl.build(:user, first_name: nil, last_name: nil)
    expect(user).to be_valid
  end
  

  it "has a valid factory" do
  	user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end


	it "is invalid without a email" do
	 user = FactoryGirl.build(:user, email: nil)#.should_not be_valid
	 expect(user).not_to be_valid
	end

	it "is invalid without a password" do
	 user = FactoryGirl.build(:user, password: nil)#.should_not be_valid
	 expect(user).not_to be_valid
	end

	it "is invalid without a password_confirmation" do
	 user = FactoryGirl.build(:user, password_confirmation: "qazplm123")#.should_not be_valid
	 expect(user).not_to be_valid
	 expect(user.valid?).to eq(false)
	end
end


