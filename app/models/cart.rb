class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items

  def add_item(item)
    LineItem.find_by(cart: self, item_id: item) || LineItem.new(cart: self, item_id: item)
  end

  def total
    line_items.collect do |li|
      li.item.price * li.quantity
    end.inject(0, :+)
  end

end
