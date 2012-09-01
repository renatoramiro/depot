class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = Time.now.strftime("%d/%m/%Y %H:%M:%S")
  	@message = show_message
  end

private
  def count_sessions
		session[:counter] ||= 0
		session[:counter] += 1
	end

	def show_message
		counter = count_sessions
		@message = "This page was accessed #{counter} times." if counter > 5
	end
end
