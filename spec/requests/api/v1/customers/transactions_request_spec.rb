require 'rails_helper'

describe "customers transactions endpoints" do
  context "customers/:id/transactions" do
    it "returns a collection of customers" do
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)
      transaction = create(:transaction, invoice_id: invoice.id)

      get "/api/v1/customers/#{customer.id}/transactions"

      transactions_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions_json.first["id"]).to eq(customer.transactions.first.id)
    end
  end
end
