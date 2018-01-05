class Api::V1::TripsController < ApplicationController

  respond_to :json

  def show
    respond_with Trip.find(params[:id])
  end

  def index
    if params[:user_id]
      respond_with Trip.where(user_id: params[:user_id])
    else
      respond_with Trip.all
    end
  end

  def create
    trip = current_user.trips.build(trip_params)
    if trip.save
      render json: trip, status: 201, location: [:api, trip]
    else
      render json: { errors: trip.errors }, status: 422
    end
  end

  def update
    trip = current_user.trips.find(params[:id])
    if trip.update(trip_params)
      render json: trip, status: 200, location: [:api, trip]
    else
      render json: { errors: trip.errors }, status: 422
    end
  end

  def destroy
    trip = current_user.trips.find(params[:id])
    trip.destroy
    head 204
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :from_city, :to_city, :start_date, :end_date, :price, :published)
  end

end
