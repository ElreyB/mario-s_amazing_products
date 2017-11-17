class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_of_origin, :presence => true

  scope :recent_products, -> { where("created_at >= ?", (DateTime.now - 1.days)).order(created_at: :desc).limit(3)}

  scope :use_products, -> { where({country_of_origin: "USA"})}

end
