class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    render json: Invoice.find(params[:id]).transactions.all
  end
end
