require 'rails_helper'

describe "merchants most items endpoint" do
  context "merchants/most_items" do
    it "returns merchants ranked by total number of items sold" do
      merchant = create(:merchant)
      merchant1 = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 2)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 600)

      get "/api/v1/merchants/most_items"

      most_items_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_items_json.first["id"]).to eq(merchant1.id)
    end
  end
  context "merchants/most_items?quantity=x" do
    it "returns top x merchants ranked by total number of items sold" do
      merchant = create(:merchant)
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant1.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 2)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 600)
      invoice_item = create(:invoice_item, invoice_id: invoice2.id, quantity: 1)

      get "/api/v1/merchants/most_items?quantity=2"

      most_items_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_items_json.first["id"]).to eq(merchant1.id)
      expect(most_items_json.last["id"]).to eq(merchant.id)
      expect(most_items_json.count).to eq(2)
    end
  end
end
