require 'rails_helper'

describe "merchants revenue endpoint" do
  context "merchants/:id/revenue" do
    it "returns total revenue for merchant across all transactions" do
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
  context "merchants/:id/revenue?date" do
    it "returns total revenue for merchant across all transactions for date" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-10 00:54:09 UTC")
      invoice1 = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-11 00:54:09 UTC")
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 60, unit_price: 20)

      get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-10 00:54:09"

      revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(revenue_json["revenue"]).to eq("5.0")
    end
  end
end
