class Api::V1::Items::MostRevenueController < ApplicationController
  def index
    items = Item.all
    render json: items.most_revenue(params[:quantity])
  end
end
