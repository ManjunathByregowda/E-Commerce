class Order < ActiveRecord::Base

	#callback
	before_validation :assign_initial_values
	after_create :copy_cart_line_items_to_order_line_items
	after_create :empty_user_cart_line_items
	after_create :send_order_confirmation_notification

	validates_presence_of :order_date, :order_number, :user_id

	has_many :order_line_items
	belongs_to :user

	def assign_initial_values
		self.order_date = Date.today
		self.order_number = "DCT-#{Random.rand(1000..10000)}"
	end
	def copy_cart_line_items_to_order_line_items
		cart_line_items = CartLineItem.where('user_id =?',self.user_id)
		order_total = 0
		cart_line_items.each do |cart_line_item|
			order_line_item = OrderLineItem.new
			order_line_item.order_id = self.id
			order_line_item.product_id = cart_line_item.product_id
			order_line_item.price = cart_line_item.product.price
			order_line_item.quantity = cart_line_item.quantity
			order_total += order_line_item.price * order_line_item.quantity
			order_line_item.save
		end
		self.update_attributes(total: order_total)
	end
	def empty_user_cart_line_items
		cart_line_items = CartLineItem.where('user_id = ?', self.user_id)
		cart_line_items.each do |cart_line_item|
			cart_line_item.destroy
		end
	end
	
	def send_order_confirmation_notification
		Notification.order_confirmation(self).deliver!
	end 
end

# controller
# callback - before_validation
# model - before_validation
# save 