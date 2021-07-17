class PackagesController < ApplicationController
    before_action :set_courier!

    def create
        @package = @courier.packages.build package_params

        if @package.save
            flash[:success] = "Package created!";
            redirect_to courier_path(@courier)
        else
            @packages = @courier.packages.order created_at: :desc
            render 'couriers/show'
        end
    end

    private

    def package_params
        params.require(:package).permit(:tracking_number, :delivery_status)
    end

    def set_courier!
        @courier = Courier.find params[:courier_id]
    end
end