require 'rails_helper'

describe "invoice items item endpoint" do
  context "GET /invoice_items/:id/item" do
    it "returns associated item" do
      item = create(:item)
      invoice_item = create(:invoice_item, item_id: item.id)

      get "/api/v1/invoice_items/#{invoice_item.id}/item"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["id"]).to eq(item.id)
    end
  end
end
