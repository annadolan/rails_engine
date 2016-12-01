class Api::V1::Transactions::FindController < ApplicationController
  def index
    render json: Transaction.where(merchant_params)
  end

  def show
    render json: Transaction.find_by(merchant_params)
  end

 private

 def merchant_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end
