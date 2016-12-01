class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.all
    render json: merchants.find_total_revenue(params[:date]), serializer: TotalRevenueSerializer
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: merchant.find_revenue(params[:date]), serializer: RevenueSerializer
  end
end
