require 'rails_helper'

describe "invoice_items endpoints" do
  context "get /invoice_items" do
    it "returns a list of invoice items" do
      create_list(:invoice_item, 3)

      get "/api/v1/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq(3)
    end
  end
end
