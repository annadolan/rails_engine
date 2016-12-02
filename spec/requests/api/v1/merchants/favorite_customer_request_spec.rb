require 'rails_helper'

describe "merchants favrorite customer endpoint" do
  context "merchants/:id/favrorite_customer" do
    it "returns the customer who has most successful transactions" do
      merchant1, merchant2= create_list(:merchant, 2)
      customer1, customer2 = create_list(:customer, 2)
      invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
      transaction = create(:transaction, invoice_id: invoice1.id, result: 'success')
      transaction = create(:transaction, invoice_id: invoice1.id, result: 'success')
      transaction = create(:transaction, invoice_id: invoice2.id, result: 'success')

      get "/api/v1/merchants/#{merchant1.id}/favorite_customer"

      favorite_customer_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(favorite_customer_json['id']).to eq(customer1.id) 
    end
  end
end
