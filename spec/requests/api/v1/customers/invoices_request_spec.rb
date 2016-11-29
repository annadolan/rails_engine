require 'rails_helper'

describe "customers invoices endpoints" do
  context "customers/:id/invoices" do
    it "returns a collection of invoices" do
      customer = create(:customer)
      create_list(:invoice, 3, customer_id: customer.id)

      get "/api/v1/customers/#{customer.id}/invoices"

      invoices_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices_json.first["customer_id"]).to eq(customer.id)
    end
  end
end
