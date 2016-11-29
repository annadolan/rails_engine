require 'rails_helper'

describe "items endpoints" do
  context "get /items" do
    it "returns a list of all items" do
      create_list(:item, 3)

      get "/api/v1/items"

      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq(3)
    end
  end

  context "get items/:id" do
    it "returns a specific item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["name"]).to eq("MyString")
    end
  end
end
