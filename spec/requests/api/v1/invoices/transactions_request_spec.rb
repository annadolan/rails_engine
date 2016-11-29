require 'rails_helper'

describe "invoices transactions endpoints" do
  context 'GET invoices/:id/transactions' do
    it "returns a list of all associated transactions" do
      invoice = create(:invoice)
      create_list(:transaction, 3, invoice_id: invoice.id)

      get "/api/v1/invoices/#{invoice.id}/transactions"

      transactions = JSON.parse(response.body)
      
      expect(response).to be_success
      expect(transactions.first["invoice_id"]).to eq(invoice.id)
    end
  end
end
