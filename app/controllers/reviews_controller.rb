class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Your review has been saved!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix these errors:"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review =Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Your review has been update!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Please fix these errors:"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end


private

  def review_params
    params.require(:review).permit(:author, :content, :rating)
  end

end
