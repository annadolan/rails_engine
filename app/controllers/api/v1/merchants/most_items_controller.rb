class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    merchant = Merchant.all
    render json: merchant.rank_by_items_sold(params[:quantity])
  end
end
