class Review < ActiveRecord::Base
  belongs_to :product

  validates :author, :content, :rating, :presence => true
  validates :content, length: { within: 50..250}
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
