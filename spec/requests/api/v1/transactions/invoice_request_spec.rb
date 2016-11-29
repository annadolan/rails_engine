require 'rails_helper'

describe "transaction invoice endpoints" do
  context "transaction/:id/invoice" do
    it "returns associated invoice" do
      invoice = create(:invoice)
      transaction = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/transactions/#{transaction.id}/invoice"

      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_json["id"]).to eq(transaction.invoice_id)
    end
  end
end
