require 'rails_helper'

describe "items find" do
  context "items/find?params" do
    it "returns item by specified param" do
      item = create(:item)

      get "/api/v1/items/find?name=#{item.name}"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["name"]).to eq("MyString")
    end
  end

  context "items/find_all?params" do
    it "returns multiple items by params" do
      item1 = create_list(:item, 3, name: "anthony")
      item2 = create_list(:item, 3, name: "tony")

      get "/api/v1/items/find_all?name=#{item1.first.name}"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json.first["name"]).to eq("anthony")
      expect(item_json.count).to eq(3)
    end
  end
end
