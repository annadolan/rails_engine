require 'rails_helper'

describe "merchants most revenue by quantity endpoint" do
  context "merchants/most_revenue?quantity=3" do
    it "returns the top x merchants by total revenue" do
      merchant1, merchant2, merchant3 = create_list(:merchant, 3)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant3.id)
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice3.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 50)
      invoice_item = create(:invoice_item, invoice_id: invoice2.id, quantity: 2)
      invoice_item = create(:invoice_item, invoice_id: invoice3.id, quantity: 600)

      get "/api/v1/merchants/most_revenue?quantity=5"

      most_revenue_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(most_revenue_json.first["id"]).to eq(merchant3.id)
    end
  end
end
