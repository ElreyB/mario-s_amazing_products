class Product < ActiveRecord::Base

  validates :name, :cost, :country_of_origin, :presence => true
  has_many :reviews

  scope :recent_products, -> { where("created_at >= ?", (DateTime.now - 1.days)).order(created_at: :desc).limit(3)}

  scope :use_products, -> { where({country_of_origin: "USA"})}

end
