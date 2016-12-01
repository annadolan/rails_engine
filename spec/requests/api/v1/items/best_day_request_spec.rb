require 'rails_helper'

describe "items best_day" do
  context "items/:id/best_day" do
    it "returns the customer who has most successful transactions" do
      item1, item2 = create_list(:item, 2)
      invoice1 = create(:invoice, created_at: '2012-03-11 00:54:09 UTC')
      invoice2 = create(:invoice, created_at: '2011-03-11 00:54:09 UTC')
      invoice_items = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, item_id: item1.id)
      invoice_items = create(:invoice_item, invoice_id: invoice2.id, quantity: 10, item_id: item2.id)

      get "/api/v1/items/#{item1.id}/best_day"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item1.best_day.created_at).to eq("Sun, 11 Mar 2012 00:54:09 UT")
    end
  end
end
