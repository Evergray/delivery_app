class CouriersController < ApplicationController
    before_action :find_courier!, only: %i[show destroy edit update]

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
    end

    def update
        if @courier.update courier_params
            flash[:success] = 'Courier updated!'
            redirect_to couriers_path
        else
            render :edit
        end
    end

    def destroy
        @courier.destroy
        flash[:success] = 'Courier deleted!'
        redirect_to couriers_path
    end

    def show
        @package = @courier.packages.build
        @packages = @courier.packages.order created_at: :desc                
    end

    private

    def courier_params
        params.require(:courier).permit(:name, :email)
    end

    def find_courier!
        @courier = Courier.find params[:id]
    end
end