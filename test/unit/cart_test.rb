require 'test_helper'

class CartTest < ActiveSupport::TestCase

  test "adding two unique products to a cart" do

    #remember I have to explicitly SAVE to make sure things show up in the database
    #before I was not saving so these tests were failing. must call .save

    cart = Cart.create

    cart.add_product(products(:ruby).id, products(:ruby).price)
    cart.save
    
    cart.add_product(products(:rails).id, products(:rails).price)
    cart.save

    assert_equal(2,cart.line_items.count, "Expected cart to have 2 items. Actual: #{cart.line_items.count}")
  end

  test "adding the same product to a cart" do

    #in add_products, it was checking to see product:ruby was already in the database.
    #since i didn't save before, it didn't find product:ruby already in the database, so the second
    #time I tried to add product:ruby it worked even though it shouldn't have. Hence this test failed
    #without the cart.save

    cart = Cart.create

    cart.add_product(products(:ruby).id, products(:ruby).price)
    cart.save
    assert_equal(1, cart.line_items.count, "Expected cart to have 1 item, Actual: #{cart.line_items.count}")

    cart.add_product(products(:ruby).id, products(:ruby).price)
    cart.save
    assert_equal(1, cart.line_items.count, "Expected cart to have 1 item, Actual: #{cart.line_items.count}")
  end
end
