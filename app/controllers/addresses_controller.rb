class AddressesController < ApplicationController

	before_action :authenticate_user!

	def index
		@addresses = current_user.addresses
		@address = Address.new
	end
	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		if @address.save
			redirect_to addresses_path, notice: "Your Address is succresfully added"
		end
	end

	private

	def address_params
		params[:address].permit(:details, :landmark, :city, :state, :pincode)
	end
end
