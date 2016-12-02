class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    if params.include?("unit_price")
      render json:  InvoiceItem.dollar_to_cents_all(params['unit_price'])
    else
      render json: InvoiceItem.where(merchant_params)
    end
  end

  def show
    if params.include?("unit_price")
      render json: InvoiceItem.dollar_to_cents_one(params['unit_price'])
    else
      render json: InvoiceItem.find_by(merchant_params)
    end
  end

 private

 def merchant_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :updated_at, :created_at)
  end
end
