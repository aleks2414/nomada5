class SearchController < ApplicationController

def search
  if params[:search].nil?

    @nomads = []
    @trips = []
    @experiences = []

  else
    @nomads = Nomad.search params[:search]
    @trips = Trip.search params[:search]
    @experiences = Experience.search params[:search]
  end
end

end
