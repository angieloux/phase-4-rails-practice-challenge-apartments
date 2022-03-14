class ApartmentsController < ApplicationController
    
    before_action :find_apartment, only: %i[show edit update destroy]
    

    def index
        @apartments = Apartment.all
    end

    def show 
    end

    def new
        @apartment = Apartment.new
    end

    def create
        respond_to do |format|
            if @apartment.save
                format.html { redirect_to @apartment, notice: "Apartment #{apartment.number} successfully created."}
                format.json { render 'show', status: :created, location: @apartment}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json  {render json: @listing.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
    end

    def destroy 
    end

    private

    def find_apartment
        @apartment = Apartment.find(params[:id])
    end

    def apartment_params
        params.require(:apartment).permit(:number)
    end
end
