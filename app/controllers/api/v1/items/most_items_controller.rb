class Api::V1::Items::MostItemsController < ApplicationController
  def index
    items = Item.all
    render json: items.rank_by_items_sold(params[:quantity])
  end
end
