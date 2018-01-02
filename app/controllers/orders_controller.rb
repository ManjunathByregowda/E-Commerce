class OrdersController < ApplicationController

	before_action :authenticate_user!

	def index
		@orders = current_user.orders
	end
	def create
		@order =Order.new(order_params)
		@order.user_id = current_user.id
		if @order.save
			redirect_to orders_path, notice: "Your order has been successfully placed"
		end
	end
	private
	def order_params
		params[:order].permit(:address_id)
	end
end
