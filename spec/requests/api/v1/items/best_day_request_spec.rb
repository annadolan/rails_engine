require 'rails_helper'

describe "items best_day" do
  context "items/:id/best_day" do
    it "returns the day with most successful transactions" do
      item1, item2 = create_list(:item, 2)
      invoice1 = create(:invoice, created_at: '2012-03-11 00:54:09 UTC')
      invoice2 = create(:invoice, created_at: '2012-03-11 00:54:09 UTC')
      invoice3 = create(:invoice, created_at: '2011-03-11 00:54:09 UTC')
      invoice_items = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, item_id: item1.id)
      invoice_items1 = create(:invoice_item, invoice_id: invoice2.id, quantity: 10, item_id: item2.id)
      invoice_items2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 10, item_id: item2.id)

      get "/api/v1/items/#{item1.id}/best_day"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json['best_day'].to_datetime).to eq(invoice1.created_at.to_datetime)
    end
  end
end
