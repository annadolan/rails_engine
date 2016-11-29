require 'rails_helper'

describe "items merchant endpoint" do
  context 'GET items/:id/merchant' do
    it "returns associated merchant" do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/#{item.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(item.merchant_id)
    end
  end
end
