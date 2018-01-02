class CartLineItemsController < ApplicationController

	before_action :authenticate_user!

	def index
		@cart_line_items = current_user.cart_line_items
		@order = Order.new
		@addresses = current_user.addresses
	end
	def create
		@cart_line_item = CartLineItem.new(cart_line_item_params)
		@cart_line_item.user_id = current_user.id
		if @cart_line_item.save_or_update
			redirect_to cart_line_items_path, notice: "product has been successfully added to the cart."
		end
	end
	def destroy 
		@cart_line_item = CartLineItem.find(params[:id])
		@cart_line_item.destroy
		redirect_to cart_line_items_path, notice: "the product was removed from your cart"
	end

private 

	def cart_line_item_params
		params[:cart_line_item].permit(:product_id, :quantity)
	end

end
