class TenantsController < ApplicationController
    before_action :find_tenant, only: %i[show edit update destroy ]
    

    def index
        # display the tenant/s of the chosen apartment 
        @tenants = Tenant.find(params[:apartment_id])
        @apartment = Apartment.find(params[:apartment_id])

    end

    def show 
    end

    def new
        @tenant = tenant.new
    end

    def create
        respond_to do |format|
            if @tenant.save
                format.html { redirect_to @tenant, notice: "tenant #{tenant.number} successfully created."}
                format.json { render 'show', status: :created, location: @tenant}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json  {render json: @listing.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @tenant.update(tenant_params)
                format.html { redirect_to @tenant, notice: "tenant #{tenant.number} successfully updated."}
                format.json { render 'show', status: :ok, location: @tenant}
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json  {render json: @listing.errors, status: :unprocessable_entity }
            end
        end

    end

    def destroy 
        @tenant.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "tenant #{tenant.number} was successfully removed from the database." }
            format.json { head :no_content }
        end
    end




    private

    def find_tenant
        @tenant = tenant.find(params[:id])
    end

    def tenant_params
        params.require(:tenant).permit(
            :age, :name
        )
    end
end
