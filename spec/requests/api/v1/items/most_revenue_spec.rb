require 'rails_helper'

describe "items most revenue endpoint" do
  context "items/most_revenue" do
    it "returns items ranked by total revenue" do
      item = create(:item)
      item1 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 100, unit_price: 20)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id, quantity: 50, unit_price: 30)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 50, unit_price: 60)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")

      get "/api/v1/items/most_revenue"

      most_revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_revenue_json.first["id"]).to eq(item1.id)
    end
  end
  context "merchants/most_revenue?quantity=x" do
    it "returns top x items ranked by total revenue" do
      item = create(:item)
      item1 = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 100, unit_price: 20)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id, quantity: 50, unit_price: 30)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 50, unit_price: 60)
      invoice_item = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 100, unit_price: 15)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")

      get "/api/v1/items/most_revenue?quantity=2"

      most_revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_revenue_json.first["id"]).to eq(item1.id)
      expect(most_revenue_json.last["id"]).to eq(item.id)
      expect(most_revenue_json.count).to eq(2)
    end
  end
end
