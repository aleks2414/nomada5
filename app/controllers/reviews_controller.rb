class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_experience
  before_action :set_trip


  def create
    @review = Review.new(review_params)
    @review.experience_id = @experience.id
    @review.trip_id = @experience.trip_id

    if @review.save
      redirect_to trip_experience_path(@trip, @experience)
    else
      render 'new'
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_experience
      @experience = Experience.find(params[:experience_id])
    end

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def review_params
      params.require(:review).permit(:star, :comment)
    end
end