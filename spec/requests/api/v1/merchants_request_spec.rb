require 'rails_helper'

describe "merchants endpoints" do
  context 'GET /merchants' do
    it "returns a list of all merchants" do
      create_list(:merchant, 3)

      get "/api/v1/merchants"

      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchants.count).to eq(3)
    end
  end
  context 'GET /merchants/:id' do
    it "returns a single merchant" do
      merchant = create(:merchant, name: "Store")

      get "/api/v1/merchants/#{merchant.id}"

      merchant_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_json["name"]).to eq("Store")
    end
  end
end
