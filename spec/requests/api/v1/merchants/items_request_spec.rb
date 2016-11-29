require 'rails_helper'

describe "merchants items endpoints" do
  context "merchants/:id/invoices" do
    it "returns a collection of items" do
      merchant = create(:merchant)
      create_list(:item, 3, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/items"

      merchant_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_json.first["merchant_id"]).to eq(merchant.id)
    end
  end
end
