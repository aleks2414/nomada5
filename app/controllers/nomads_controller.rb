class NomadsController < ApplicationController
  def show
  	@nomad = Nomad.find(params[:id])
  	@trips = @nomad.trips	
  end
end