class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item)
    LineItem.find_by(cart: self, item_id: item) || LineItem.new(cart: self, item_id: item)
  end

  def total
    items.sum(:price)
  end

end
