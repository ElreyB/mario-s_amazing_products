class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_of_origin, :presence => true

  scope :three_recent_products, -> { where("created_at <= ?", (DateTime.now)).order(created_at: :desc).limit(3)}

  scope :usa_products, -> { where({ country_of_origin: ["USA", "usa", "United States of America"] }) }

  def self.most_reviewed_product
    if most_reviewed_product_id
      product = Product.find(most_reviewed_product_id)
      return product
    end
  end

  def find_average
    product_reviews = Review.of_product(self.id)
    if product_reviews.length > 0
      average_rating = product_reviews.reduce(0) do |sum, product|
        sum + product.rating
      end
      return average_rating / product_reviews.length
    else
      return false
    end
  end

  def self.three_images
    images = product_images.shuffle
    carousel_images = [images[0], images[1], images[2]]
  end

private

  def self.product_images
    products = Product.all
    products.map { |product| product.image }
  end

  def self.review_product_ids
    reviews = Review.all
    product_ids = reviews.map{ |review| review.product_id }
    product_ids
  end

  def self.product_id_with_count
    product_ids = review_product_ids
    product_ids.reduce(Hash.new(0)) do |id_counts, product_id|
      id_counts[product_id] += 1
      id_counts
    end
  end

  def self.most_reviewed_product_id
    product_ids = product_id_with_count
    product_ids.key(product_ids.values.max)
  end

end
