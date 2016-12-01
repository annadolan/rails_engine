class Api::V1::Items::BestDayController < ApplicationController
  def index
     render json: Item.find(params[:id]).invoices.joins(:transactions).where(transactions: {result: 'success'}).group(:id, :created_at).order("count(*) desc").first, serializer: BestDaySerializer
  end
end
