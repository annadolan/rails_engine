class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    @most_revenue = Merchant.find(params[:merchant_id]).invoices.joins(:transactions).where.not(transactions: {result: "failed"}).joins(:invoice_items).sum("quantity * unit_price")

    render json: @most_revenue
   end
end
