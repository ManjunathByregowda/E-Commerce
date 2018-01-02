class CategoriesController < ApplicationController
	  before_action :authenticate_user!, except: [:index, :show, :find_sub_categories]
	  before_action :check_is_admin, except: [:index, :show, :find_sub_categories]
	def index
		@categories = Category.all
		@categories = Category.paginate(:page => params[:page])
	end

	def new
		@category =Category.new
	end
	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else 
			render action: "new"
		end
	end
	def show
		@category = Category.find(params[:id])
		# @products = Product.where('category_id = ?',@category.id)
	end
	def edit
		@category = Category.find(params[:id])
	end
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes (category_params)
			redirect_to categories_path(@category.id)
		end
	end
	def destroy 
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	def find_sub_categories
		@sub_categories = SubCategory.where('category_id = ?', params[:category_id])
		render json: @sub_categories
	end


	private
	def category_params
		params[:category].permit(:name)
	end
end