class ProductsController < ApplicationController
  require 'open-uri'
  
  def format_price(price_in_cents)
    price_in_dollars = price_in_cents.to_f / 100
  end

  def index
    page = 1
    if params[:page]
      page = params[:page]
    end

    products_json = open("http://lcboapi.com/products?page=#{page}").read
    @products = JSON.parse(products_json)
  end

  def show
    product_json = open("http://lcboapi.com/products/#{params[:id]}").read
    product_hash = JSON.parse(product_json)
    @product = product_hash["result"]
  end

  helper_method :format_price  #allows format_price method to be used in views.
end
