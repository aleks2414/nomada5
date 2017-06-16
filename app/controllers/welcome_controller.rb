class WelcomeController < ApplicationController
  def index
  	@trips = Trip.all.order("created_at desc").limit(6)
  	@experiences_count = Experience.count
  	@trips_count = Trip.count
  end

  def map
  	@trips = Trip.all
  end
end
