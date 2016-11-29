require 'rails_helper'

describe "merchants invoices endpoints" do
  context "merchants/:id/invoices" do
    it "returns a collection of items" do
      merchant = create(:merchant)
      create_list(:invoice, 3, merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/invoices"

      merchant_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_json.first["merchant_id"]).to eq(merchant.id)
    end
  end
end
