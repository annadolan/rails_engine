require 'rails_helper'

describe "invoices customer endpoint" do
  context 'GET invoices/:id/customer' do
    it "returns associated customer" do
      customer = create(:customer)
      invoice = create(:invoice, customer_id: customer.id)

      get "/api/v1/invoices/#{invoice.id}/customer"

      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer["id"]).to eq(invoice.customer_id)
    end
  end
end
