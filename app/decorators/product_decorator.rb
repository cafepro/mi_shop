Spree::Product.class_eval do
  has_many :order_images

  def photos
    order_images
  end
end
