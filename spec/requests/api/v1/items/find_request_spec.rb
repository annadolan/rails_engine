require 'rails_helper'

describe "items finder" do
  context "items/find?params" do
    it "returns item by specified param" do
      item = create(:item)

      get "/api/v1/items/find?#name=#{item.name}"

      item_json = JSON.parse(response.body)
      
      expect(response).to be_success
      expect(item_json["name"]).to eq("MyString")
    end
  end
end
