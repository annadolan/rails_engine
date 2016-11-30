require 'rails_helper'

describe "merchants revenue endpoint" do
  context "merchants/:id/revenue" do
    it "returns total revenue for merchants across all transactions" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)

      get "/api/v1/merchants/#{merchant.id}/revenue"

      revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue_json["revenue"]).to eq("5.0")
    end
  end
end
