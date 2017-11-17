class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :content, :rating, :presence => true
  validates :content, length: { within: 50..250}
  validates :rating, numericality: { greater_than: 1, less_than: 5}
end
