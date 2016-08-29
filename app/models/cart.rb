class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def add_item(item)
    LineItem.find_by(cart: self, item_id: item) || LineItem.new(cart: self, item_id: item)
  end

  def total
    items.sum(:price)
  end

end
