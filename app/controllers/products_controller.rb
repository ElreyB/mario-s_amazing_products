class ProductsController < ApplicationController

  def index
    @products = Product.all
    @usa_products = Product.usa_products
    @three_recent_products = Product.three_recent_products
    @most_reviewed_product = Product.most_reviewed_product
    @carousel_images = Product.three_images
  end

  def show
    @product = Product.find(params[:id])
    @average_rating = @product.find_average
  end

  def new
    @product = Product.new
  end

  def create
    image_category = [ "abstract", "animals", "business", "cats", "city", "food", "nightlife", "fashion", "people", "nature", "sports", "technics", "transport"]
    index = rand(1..10)

    @product = Product.new(product_params)
    @product.image = Faker::LoremPixel.image("200x200", false, image_category[rand(0..image_category.length-1)], index)
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
