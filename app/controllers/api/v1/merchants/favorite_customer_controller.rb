class Api::V1::Merchants::FavoriteCustomerController < ApplicationController

  def index
    render json: Merchant.find(params[:id]).favorite_customer
  end
end
