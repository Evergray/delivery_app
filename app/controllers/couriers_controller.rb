class CouriersController < ApplicationController
    def index
        @couriers = Courier.all
    end
end