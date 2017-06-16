class InvitationsController < ApplicationController

def new
    @invitation = Invitation.new
end

def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.request = request
    if @invitation.deliver
      flash.now[:notice] = 'Invitation Send, Thaks'
    else
      flash.now[:error] = 'Sorry, cannot send invitation'
      render :new
    end
end

end
