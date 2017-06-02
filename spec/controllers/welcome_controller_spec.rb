require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
   
   #devise before filter authenticate_user
   before do
     allow(controller).to receive(:authenticate_user!).and_return(true)
   end
   
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the users into users" do
      User.destroy_all
      user1, user2 = FactoryGirl.create(:user), FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

end