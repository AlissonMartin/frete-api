class CompanyController < ApplicationController

  def create
    company = Company.new(company_params)
    company.owner = @user
    if company.save
      @user.update(company: company)
      render json: company
    else
      render json: {error: "Falha ao criar empresa"}, status: :bad_request
    end

  end

  private

  def company_params
    params.permit(:name, :federal_tax_id)
  end


end
