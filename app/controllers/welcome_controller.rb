class WelcomeController < ApplicationController
  def index
  	@experiences = Experience.all	
  end
end
