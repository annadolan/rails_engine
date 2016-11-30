class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    @merchant = Merchant.find(params[:id])
    render json: @merchant.find_total_revenue(params[:date]), serializer: RevenueSerializer
  end
end
