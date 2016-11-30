class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def index
    @favorite_merchant = Customer.find(params[:id]).merchants.joins(:transactions).where(transactions: {result: 'success'}).group(:id, :name).order("count(*) desc").first
    render json: @favorite_merchant
  end
end
