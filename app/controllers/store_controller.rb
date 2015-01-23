class StoreController < ApplicationController
  def index
    @products = Product.order :title

    increment_counter    
  end

  def increment_counter
    session[:counter] ||= 1 # if session[:counter].nil?
    session[:counter] += 1
  end
end
