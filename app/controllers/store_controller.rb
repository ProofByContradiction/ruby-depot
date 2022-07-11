class StoreController < ApplicationController
  before_action :session_counter

  def session_counter
    if session[:session_counter].nil?
      session[:session_counter] = 0
    end

    session[:session_counter] += 1
    @session_counter = session[:session_counter]
  end
  def index
    @products = Product.order(:title)
  end
end
