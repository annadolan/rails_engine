class Api::V1::Items::FindController < ApplicationController

  def index
    render json: Item.where(item_params)
  end

  def show
    if params.include?("unit_price")
      a = params["unit_price"].gsub!(/[^0-9A-Za-z]/, '')
    render json:  Item.find_by(unit_price: a)
  else
    render json: Item.where(item_params).first
    end
  end

 private

 def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
