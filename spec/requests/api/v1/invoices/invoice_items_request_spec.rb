require 'rails_helper'

describe "invoices invoice items endpoints" do
  context 'GET invoices/:id/invoice_items' do
    it "returns a list of all associated invoice items" do
      invoice = create(:invoice)
      create_list(:invoice_item, 3, invoice_id: invoice.id)

      get "/api/v1/invoices/#{invoice.id}/invoice_items"

      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.first["invoice_id"]).to eq(invoice.id)
    end
  end
end
