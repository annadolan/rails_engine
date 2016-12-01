require 'rails_helper'

describe "items most items endpoint" do
  context "items/most_items" do
    it "returns items ranked by total number of items sold" do
      item = create(:item)
      item1 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id, quantity: 2)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 600)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")

      get "/api/v1/items/most_items"

      most_items_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_items_json.first["id"]).to eq(item1.id)
    end
  end
  context "merchants/most_items?quantity=x" do
    it "returns top x items ranked by total number of items sold" do
      item = create(:item)
      item1 = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 2)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 600)
      invoice_item = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 1)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")

      get "/api/v1/items/most_items?quantity=2"

      most_items_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_items_json.first["id"]).to eq(item1.id)
      expect(most_items_json.last["id"]).to eq(item.id)
      expect(most_items_json.count).to eq(2)
    end
  end
end
