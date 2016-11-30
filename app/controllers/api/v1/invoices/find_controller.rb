class Api::V1::Invoices::FindController < ApplicationController
  def index
    render json: Invoice.where(item_params)
  end

  def show
    render json: Invoice.find_by(item_params)
  end

  private

  def item_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
