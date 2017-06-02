class WelcomeController < ApplicationController
  def index
  	@users = User.all
  	respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def create
    @user = Document.create( doc_params )  if params[:user_doc].present?
    redirect_to root_url
  end

  def export_file
  	respond_to do |format|
      format.html
      format.csv { send_data User.to_csv, filename: "users-#{Time.now}.csv" }
    end
  end

  private
	def doc_params
	  unless params[:user_doc][:avatar].content_type == "text/csv"
      params.require(:user_doc).permit(:avatar)
    else
       User.insert_data params[:user_doc][:avatar]
    end 
	end
end
