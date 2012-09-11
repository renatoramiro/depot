require 'test_helper'

class CartTest < ActiveSupport::TestCase

	def setup
		@cart = Cart.create
		@book_ruby = products(:ruby)
		@book_coffeescript = products(:coffeescript)
  end

  test "add two different products" do
  	@cart.add_product(@book_ruby.id).save!
  	@cart.add_product(@book_coffeescript.id).save!
  	assert_equal 2, @cart.line_items.size
  	assert_equal(@book_ruby.price + @book_coffeescript.price, @cart.total_price)
  end

  test 'add duplicate products' do
  	@cart.add_product(@book_ruby.id).save!
  	@cart.add_product(@book_ruby.id).save!
  	assert_equal 2 * @book_ruby.price, @cart.total_price
  	assert_equal 1, @cart.line_items.size
  	assert_equal 2, @cart.line_items[0].quantity
  end
end
