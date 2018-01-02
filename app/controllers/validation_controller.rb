class ValidationController < ApplicationController

  def check_email
  	@user = User.find_by(email: params[:email])
  	if @user.nil?
  		render json:{ can_use: true }
  	else
  		render json:{ can_use: false }
  	end
  end
end
