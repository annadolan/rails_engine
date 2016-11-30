require 'rails_helper'

describe "customers finder" do
  context "customers/find?params" do
    it "returns specific customer" do
      customer = create(:customer)

      get "/api/v1/customers/find?last_name=#{customer.last_name}"

      customer_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_json["last_name"]).to eq(customer.last_name)
    end
  end
  context "customers/find_all?params" do
    it "returns all matches to query" do
      create_list(:customer, 3, last_name: "Dolan")
      create_list(:customer, 3, last_name: "Smith")

      get '/api/v1/customers/find_all?last_name=Dolan'

      customers_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers_json.first["last_name"]).to eq("Dolan")
      expect(customers_json.count).to eq(3)
    end
  end
end
