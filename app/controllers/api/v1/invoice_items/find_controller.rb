class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    render json: InvoiceItem.where(merchant_params)
  end

  def show
    render json: InvoiceItem.find_by(merchant_params)
  end

 private

 def merchant_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :updated_at, :created_at)
  end
end
