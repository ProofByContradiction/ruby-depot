class AddPriceToLineItems < ActiveRecord::Migration[7.0]
  def up
    add_column :line_items, :price, :price, precision: 8, scale: 2
    say_with_time "Updating line item prices" do
      LineItem.find_each do |line_item|
        line_item.update_attribute :price, line_item.product.price
      end
    end
  end

  def down
    remove_column :line_items, :price
  end
end
