class LeasesController < ApplicationController
    before_action :find_lease, only: %i[show edit update destroy ]
    

    def index
        # @leases = lease.all
        # @tenants = Tenant.all
        @leases = Lease.all
    end

    def show 
    end

    def new
        @lease = lease.new
    end

    def create
        respond_to do |format|
            if @lease.save
                format.html { redirect_to @lease, notice: "lease #{lease.number} successfully created."}
                format.json { render 'show', status: :created, location: @lease}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json  {render json: @listing.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @lease.update(lease_params)
                format.html { redirect_to @lease, notice: "lease #{lease.number} successfully updated."}
                format.json { render 'show', status: :ok, location: @lease}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json  {render json: @listing.errors, status: :unprocessable_entity }
            end
        end

    end

    def destroy 
        @lease.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "lease #{lease.number} was successfully removed from the database." }
            format.json { head :no_content }
        end
    end




    private

    def find_lease
        @lease = Lease.find(params[:id])
    end

    def lease_params
        params.require(:lease).permit(
            :rent,
            apartment_attributes: [ :number ],
            tenant_attributes: [ :age, :name]
        )
    end
end
