class Product < ActiveRecord::Base
# check for non empty fields
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
# check for non repetition of title
  validates :title, uniqueness: true

# check for proper url format
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

def self.latest
    Product.order(:updated_at).last
  end
end

