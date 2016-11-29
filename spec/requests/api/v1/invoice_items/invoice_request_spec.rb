require 'rails_helper'

describe "invoices endpoints" do
  context "GET /invoice_items/:id/invoice" do
    it "returns associated invoice" do
      invoice = create(:invoice)
      invoice_item = create(:invoice_item, invoice_id: invoice.id)

      get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_json["id"]).to eq(invoice.id)
    end
  end
end
