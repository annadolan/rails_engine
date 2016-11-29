require 'rails_helper'

describe "customers endpoints" do
  context 'GET /customers' do
    it "returns a list of all customers" do
      create_list(:customer, 3)

      get "/api/v1/customers"

      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq(3)
    end
  end
  context 'GET /customers/:id' do
    it "returns a single customer" do
      customer = create(:customer, first_name: "Anna")

      get "/api/v1/customers/#{customer.id}"

      customer_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_json["first_name"]).to eq("Anna")
    end
  end
end
