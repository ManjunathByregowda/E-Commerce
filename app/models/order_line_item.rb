class OrderLineItem < ActiveRecord::Base
	validates_presence_of :order_id, :product_id, :quantity, :price

	belongs_to :order
	belongs_to :product
end
