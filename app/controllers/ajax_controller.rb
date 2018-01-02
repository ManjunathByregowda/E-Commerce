class AjaxController < ApplicationController

  def find_by_categories
  	if params[:category_ids] != ""
     @products = Product.where(category_id: params[:category_ids].split(","))
    else 
      @products = Product.all
    end 
    render json: @products
  end

  def autocomplete
    if params[:search] != ""
      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
    else
      @products = Product.all
    end
    render json: @products
  end

  def cod_eligible
    @products = params[:cod] ? Product.where('cod_eligible = ?', true ) : Product.where('cod_eligible = ?', false)
    render json: @products
  end

  def low_to_high
  	@products = Product.order(:price)
  	render json: @products
  end

  def high_to_low
  	@products = Product.order(price: :desc)
  	render json: @products
  end

end
 