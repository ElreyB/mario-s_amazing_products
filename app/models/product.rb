class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_of_origin, :presence => true

  scope :three_recent_products, -> { where("created_at <= ?", (DateTime.now)).order(created_at: :desc).limit(3)}

  scope :usa_products, -> { where({ country_of_origin: ["USA", "usa", "United States of America"] }) }

  def self.most_reviewed_product
    product = Product.find(most_reviewed_product_id)
    product
  end


private

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
