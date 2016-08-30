class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def self.update_inventory(line_items)
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end
end
