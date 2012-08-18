class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end
end
