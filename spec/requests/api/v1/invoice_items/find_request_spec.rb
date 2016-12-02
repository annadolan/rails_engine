require 'rails_helper'

describe "invoice_items find" do
  context "invoice_items/find?params" do
    it "returns invoice item by quantity" do
      invoice_item = create(:invoice_item, quantity: 10)
      invoice_item1 = create(:invoice_item, unit_price: "650")

      get "/api/v1/invoice_items/find?quantity=10"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json["id"]).to eq(invoice_item.id)
    end

    it "returns an invoice item by unit price" do
      invoice_item = create(:invoice_item, quantity: 10)
      invoice_item1 = create(:invoice_item, unit_price: "600")

      get "/api/v1/invoice_items/find?unit_price='600'"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json["id"]).to eq(invoice_item1.id)
    end

    it "returns an invoice item by item id" do
      item = create(:item, id: 6)
      item1 = create(:item, id: 7)
      invoice_item = create(:invoice_item, item_id: item.id)
      invoice_item1 = create(:invoice_item, item_id: item1.id)

      get "/api/v1/invoice_items/find?item_id=6"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json["id"]).to eq(invoice_item.id)
    end

    it "returns an invoice item by invoice id" do
      invoice = create(:invoice, id: 6)
      invoice1 = create(:invoice, id: 7)
      invoice_item = create(:invoice_item, invoice_id: invoice.id)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id)

      get "/api/v1/invoice_items/find?invoice_id=6"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json["id"]).to eq(invoice_item.id)
    end
  end

  context "invoice_items/find_all?params" do
    it "returns multiple invoice items by quantity" do
      invoice_items1 = create_list(:invoice_item, 3, quantity: 10)
      invoice_items2 = create_list(:invoice_item, 3, quantity: 11)

      get "/api/v1/invoice_items/find_all?quantity=10"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json.first["id"]).to eq(invoice_items1.first.id)
      expect(invoice_item_json.count).to eq(3)
    end
    
    it "returns multiple invoice items by unit price" do
      invoice_items1 = create_list(:invoice_item, 3, unit_price: "300")
      invoice_items2 = create_list(:invoice_item, 3, unit_price: "200")

      get "/api/v1/invoice_items/find_all?unit_price='200'"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json.first["id"]).to eq(invoice_items2.first.id)
      expect(invoice_item_json.count).to eq(3)
    end
  end
end
