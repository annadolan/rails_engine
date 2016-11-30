require 'rails_helper'

describe "invoice_items find" do
  context "invoice_items/find?params" do
    it "returns item by specified param" do
      invoice_item = create(:invoice_item, quantity: 10)

      get "/api/v1/invoice_items/find?quantity=10"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json["quantity"]).to eq(10)
    end
  end

  context "invoice_items/find_all?params" do
    it "returns multiple transactions by params" do
      invoice_items1 = create_list(:invoice_item, 3, quantity: 10)
      invoice_items2 = create_list(:invoice_item, 3, quantity: 11)

      get "/api/v1/invoice_items/find_all?quantity=10"

      invoice_item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_item_json.first["quantity"]).to eq(10)
      expect(invoice_item_json.count).to eq(3)
    end
  end
end
