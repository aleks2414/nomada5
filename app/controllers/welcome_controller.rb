class WelcomeController < ApplicationController
  def index
  	@trips = Trip.all
  	@experiences_count = Experience.count
  	@trips_count = Trip.count
  end

  def map
  	@trips = Trip.all
  end
end
