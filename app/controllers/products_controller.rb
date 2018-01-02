class ProductsController < ApplicationController
	 before_action :authenticate_user!, except: [:index, :show, :By_category, :check_cod_eligible, :check_by_search, :By_price_between_100_to_500,:By_price_less_than_100, :By_price_greater_than_500]
	 before_action :check_is_admin, except: [:index, :show, :By_category,:check_cod_eligible, :check_by_search, :By_price_between_100_to_500, :By_price_less_than_100, :By_price_greater_than_500]
	def index
		@products = Product.all
		@products = Product.paginate(:page => params[:page])

		@product = Product.new
	end

	# is used for instantiate an object and setup form
	def new
		@product = Product.new
	end
# is used to validate the information is coming from the form, if the validations pass insert the record to the data base and redirect the user to another page, else display the error messages on the form telling the user why the form failed
	def create
		#binding.pry
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path(@product.id)
		else
			render action: "new"
		end
	end
	def show
		@product = Product.find(params[:id])
		@category = Category.find(@product.category_id)
		@review = Review.new
		@cart_line_item = CartLineItem.new
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes (product_params)
			redirect_to products_path ,  notice:"product succesfully updated"
		else
			render action: "edit"
		end
	end

	def destroy 
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice:"product succesfully deleted"
	end

	def By_category
		#binding.pry
 		@products = Product.where('category_id = ?', params[:category_id])
 		#binding.pry
 		render json: @products
 	end

	def check_cod_eligible
		#binding.pry
		@products = Product.where('cod_eligible=?', params[:cod_eligible])
		#binding.pry
		render json: @products
	end

	def check_by_search
		@products = Product.where("name LIKE ? ", "%#{params[:name]}%")
		render json: @products
	end

	def By_price_between_100_to_500
 		@products = Product.where('price BETWEEN ? AND ?',100,500)
 		render json: @products
 	end

 	def By_price_less_than_100
 		@products = Product.where('price < ?',100)
 		render json: @products
 	end

 	def By_price_greater_than_500
 		@products = Product.where('price > ?',500)
 		render json: @products
 	end


	private
# strong parameters - used to prevent from mass assignment web attack
	def product_params
		params[:product].permit(:name, :category_id, :price, :description, :stock, :cod_eligible, :release_datetime, :image_url, :tax_id, :net_price, :sub_category_id)
	end
end
