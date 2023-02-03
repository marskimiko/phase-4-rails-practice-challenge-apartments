class TenantsController < ApplicationController

  def index
    render json: Tenant.all, status: 200
  end

  def show
    render json: Tenant.find_by_id(params[:id]), status: 200
  end

  def create
    tenant = Tenant.create(tenant_params)
    if tenant.valid?
      render json: tenant, status: 200
    else
      render json: {error: tenant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    tenant = Tenant.find_by_id(params[:id])

    if tenant.valid?
      tenant.update(tenant_params)
      render json: tenant, status: 200
    else
      render json: {error: "Tenant not found"}, status: 400
    end
  end

  def destroy
    tenant = Tenant.find_by_id(params[:id])
    tenant.destroy
    head: :no_content
  end

  private

  def tenant_params
    params.permit(:name, :age)
  end
  
end
