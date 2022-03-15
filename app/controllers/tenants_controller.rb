class TenantsController < ApplicationController
    before_action :find_tenant, only: %i[show edit update destroy ] 

    def index
        # display the tenant/s of the chosen apartment 
        if params[:apartment_id] 
            render 'show'
        else
            @tenants = Tenant.all 
            redirect_to tenants_path(@tenants)
        end  
        
        # @apartment_tenants = Tenant.find(params[:id])
        p params
    end

    def show 
        @apartment = Apartment.find(params[:apartment_id])
        @tenant = Tenant.find(params[:id])
        # redirect_to apartment_tenant_path(@tenant)
    end

    def new
        @tenant = Tenant.new
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

    def edit

    end

    def update
        respond_to do |format|
            if @tenant.update(tenant_params)
                format.html { redirect_to @tenant, notice: "tenant successfully updated."}
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
            format.html { redirect_to root_path, notice: "tenant #{@tenant.name} was successfully removed from the database." }
            format.json { head :no_content }
        end
    end




    private

    def find_tenant
        @tenant = Tenant.find(params[:id])
    end


    def tenant_params
        params.require(:tenant).permit(
            :age, :name
        )
    end
end
