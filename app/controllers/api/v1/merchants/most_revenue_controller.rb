class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    @most_revenue = Merchant.joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: 'success'}).group(:id).order('sum(invoice_items.quantity * invoice_items.unit_price) DESC').limit(params['quantity'])
    render json: @most_revenue
   end
end
