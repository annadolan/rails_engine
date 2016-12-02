require 'rails_helper'

describe "items find" do
  context "items/find?params" do
    it "returns item by name" do
      item = create(:item, name: "thing")

      get "/api/v1/items/find?name=thing"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["id"]).to eq(item.id)
    end

    it "returns item by description" do
      item = create(:item, description: "thinger")

      get "/api/v1/items/find?description=thinger"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["id"]).to eq(item.id)
    end

    it "returns item by unit price" do
      item = create(:item, unit_price: "600")

      get "/api/v1/items/find?unit_price='600'"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["id"]).to eq(item.id)
    end

    it "returns item by merchant id" do
      merchant = create(:merchant, id: 3)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/find?merchant_id=3"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["id"]).to eq(item.id)
    end
  end

  context "items/find_all?params" do
    it "returns multiple items by name" do
      item1 = create_list(:item, 3, name: "anthony")
      item2 = create_list(:item, 3, name: "tony")

      get "/api/v1/items/find_all?name=anthony"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["id"]).to eq(item1.first.id)
      expect(item_json.count).to eq(3)
    end

    it "returns multiple items by description" do
      item1 = create_list(:item, 2, description: "thinger")
      item2 = create_list(:item, 3, description: "thingy")

      get "/api/v1/items/find_all?description=thinger"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["id"]).to eq(item1.first.id)
      expect(item_json.count).to eq(2)
    end

    it "returns multiple items by unit price" do
      item1 = create_list(:item, 2, unit_price: "600")
      item2 = create_list(:item, 3, unit_price: "500")

      get "/api/v1/items/find_all?unit_price=500"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["id"]).to eq(item2.first.id)
      expect(item_json.count).to eq(3)
    end

    it "returns multiple items by merchant id" do
      merchant1 = create(:merchant, id: 5)
      merchant2 = create(:merchant, id: 3)
      item1 = create_list(:item, 2, merchant_id: merchant1.id)
      item2 = create_list(:item, 3, merchant_id: merchant2.id)

      get "/api/v1/items/find_all?merchant_id=3"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["id"]).to eq(item2.first.id)
      expect(item_json.count).to eq(3)
    end
  end
end
