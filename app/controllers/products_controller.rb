class ProductsController < ApplicationController

  # before_action :authorize, only: [:secret]
  #
  # def secret
  # end

  def index
    @products = Product.all
    @usa_products = Product.usa_products
    @three_recent_products = Product.three_recent_products
    @most_reviewed_product = Product.most_reviewed_product
  end

  def show
    @product = Product.find(params[:id])
    @average_rating = @product.find_average
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Your product has been saved!"
      redirect_to products_path
    else
      flash[:alert] = "Please fix these errors:"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product =Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Your product has been update!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix these errors:"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end


private

  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end
