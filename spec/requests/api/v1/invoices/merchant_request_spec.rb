require 'rails_helper'

describe "invoices merchant endpoint" do
  context 'GET invoices/:id/merchant' do
    it "returns associated merchant" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)

      get "/api/v1/invoices/#{invoice.id}/merchant"

      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant["id"]).to eq(invoice.merchant_id)
    end
  end
end
