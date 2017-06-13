class NomadsController < ApplicationController
  def show
  	@nomad = Nomad.find(params[:id])
  	@experiences = @nomad.experiences
  end
end
