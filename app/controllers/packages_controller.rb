class PackagesController < ApplicationController
    before_action :set_courier!
    before_action :set_package!, except: :create

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

    def destroy
        @package.destroy
        redirect_to courier_path(@courier)
    end

    def activate
        @package.delivery_status_change!
        redirect_to courier_path(@courier)
    end

    private

    def package_params
        params.require(:package).permit(:tracking_number, :delivery_status)
    end

    def set_courier!
        @courier = Courier.find params[:courier_id]
    end

    def set_package!
        @package = @courier.packages.find params[:id]
    end
end