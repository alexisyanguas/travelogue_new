class TripsController < ApplicationController
    before_action :set_trip, only: [:show, :edit, :update, :destroy]
    
    # GET /trips
    def index
        @trips = Trip.all
    end

    # GET /trips/1
    def show
    end

    # GET /trips/new
    def new
        @trip = Trip.new
    end

    # GET /trips/1/edit
    def edit
    end

    # POST /trips
    def create
        @trip = Trip.new(trip_params)

        if @trip.save
            redirect_to @trip, notice: 'Trip was successfully created.'
        else
            render :new
        end
    end

    # PATCH/PUT /trips/1
    def update
        if @trip.update(trip_params)
            redirect_to @trip, notice: 'Trip was successfully updated.'
        else
            render :edit
        end
    end

    # DELETE /trips/1
    def destroy
        @trip.destroy
        redirect_to trips_url, notice: 'Trip was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
        @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
        params.require(:trip).permit(:destination, :description, :start_date, :end_date, :user_id)
    end 
end