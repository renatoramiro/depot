class AddProductPriceToLineItems < ActiveRecord::Migration
  def up
    add_column :line_items, :price, :decimal, precision: 8, decimal: 2

    LineItem.all.each do |item|
    	item.update_attribute(:price, item.product.price)
    end
  end

  def down
  	remove_column :line_items, :price
  end
end
