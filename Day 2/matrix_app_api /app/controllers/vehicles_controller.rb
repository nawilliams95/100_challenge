class VehiclesController < ApplicationController
    def index
        render json: Vehicle.all 
    end

    def show
        vehicle = Vehicle.find(params[:id])
        render json: vehicle 
    end
    

end