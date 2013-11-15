class StoresController < ApplicationController
  require 'open-uri'
  
  def convert_min_to_time(sunday_open)
    time = (sunday_open / 60)
  end
  
  def index
    stores_json = open('http://lcboapi.com/stores?page=10').read
    @stores = JSON.parse(stores_json)
  end

  def show
    store_json = open("http://lcboapi.com/stores/#{params[:id]}").read
    store_hash = JSON.parse(store_json)
    @store = store_hash["result"]
  end

  helper_method :convert_min_to_time
end
