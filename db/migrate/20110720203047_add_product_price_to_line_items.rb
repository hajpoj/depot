class AddProductPriceToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :product_price, :decimal, :precision => 8, :scale => 2
    LineItem.all.each do |item|
      #can't just set item.product_price = item.product.price. it doesn't get saved.
      #using update_attribute saves data into the database
      item.update_attribute :product_price, item.product.price
    end
  end

  def self.down
    remove_column :line_items, :product_price
  end
end
