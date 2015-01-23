require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test 'it should calculate the total price' do
    cart = Cart.new

    ruby_book = products(:ruby)
    coffee_book = products(:coffee)

    cart.add_product(ruby_book.id, ruby_book.price).save!
    cart.add_product(coffee_book.id, coffee_book.price).save!

    assert cart.line_items.size, 2
    assert cart.total_price, 84.5
  end

  test 'it should combine the similar items' do
    cart = Cart.new
    ruby_book = products(:ruby)

    cart.add_product(ruby_book.id, ruby_book.price).save!
    cart.add_product(ruby_book.id, ruby_book.price).save!

    # cart.line_items.each{|i| puts i.inspect}

    assert cart.total_price, 99
    assert cart.line_items.size, 1
    assert cart.line_items.find_by(product_id: ruby_book.id).quantity, 2
  end

  test 'it should save the price' do
    cart = Cart.new
    ruby_book = products(:ruby)
    cart.add_product(ruby_book.id, ruby_book.price).save!

    ruby_book.update_attribute :price, 60
    cart.add_product(ruby_book.id, ruby_book.price).save!

    assert cart.total_price, 99
  end

end
