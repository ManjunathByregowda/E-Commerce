class Address < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user_id, :details, :landmark, :city, :state, :pincode
	validates_numericality_of :user_id, :pincode
	validates_length_of :pincode, is: 6
end
