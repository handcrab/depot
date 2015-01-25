class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  before_create :save_price

  def total_price
    price * quantity
  end

  def decrement
    if self.quantity > 1
      self.quantity -= 1
    else
      self.destroy
    end
    self
  end

  private
    def save_price
      self.price = self.product.price
    end
end
