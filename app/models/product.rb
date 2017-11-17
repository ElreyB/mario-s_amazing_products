class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :cost, :country_of_origin, :presence => true

  scope :three_recent_products, -> { where("created_at <= ?", (DateTime.now)).order(created_at: :desc).limit(3)}

  scope :usa_products, -> { where({ country_of_origin: ["USA", "usa", "United States of America"] }) }

end
