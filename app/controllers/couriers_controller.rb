class CouriersController < ApplicationController
    def index
        @couriers = Courier.all
    end

    def new
        @courier = Courier.new
    end

    def create
        @courier = Courier.new courier_params
        if @courier.save
            flash[:success] = 'Courier created!'
            redirect_to couriers_path
        else
            render :new
        end
    end

    def edit
        @courier = Courier.find_by id: params[:id]
    end

    def update
        @courier = Courier.find_by id: params[:id]
        if @courier.update courier_params
            flash[:success] = 'Courier updated!'
            redirect_to couriers_path
        else
            render :edit
        end
    end

    def destroy
        @courier = Courier.find_by id: params[:id]
        @courier.destroy
        flash[:success] = 'Courier deleted!'
        redirect_to couriers_path
    end

    def show
        @courier = Courier.find_by id: params[:id]        
    end

    def courier_params
        params.require(:courier).permit(:name, :email)
    end
end