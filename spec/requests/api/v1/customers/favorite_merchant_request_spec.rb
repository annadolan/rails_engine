require 'rails_helper'

describe "customers favorite merchant endpoint" do
  context "customers/:id/favorite_merchant" do
    it "returns the customer who has most successful transactions" do
      customer1, customer2 = create_list(:customer, 2)
      merchant1, merchant2 = create_list(:merchant, 2)
      invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")

      get "/api/v1/customers/#{customer1.id}/favorite_merchant"

      merchant_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_json['id']).to eq(merchant1.id)
    end
  end
end
