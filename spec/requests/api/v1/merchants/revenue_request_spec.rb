require 'rails_helper'

describe "merchants revenue endpoint" do
  context "merchants/:id/revenue" do
    it "returns total revenue for merchants across all transactions" do
      merchant = create(:merchant)


      get "/api/v1/merchants/#{merchant.id}/revenue"

      revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      #expect(revenue_json.first["merchant_id"]).to eq(merchant.id)
    end
  end
end
