# require 'rails_helper'
#
# describe "merchants total revenue endpoint" do
#   context "merchants/revenue?date=x" do
#     it "returns total revenue for date x across all merchants" do
#       merchant = create(:merchant)
#       merchant1 = create(:merchant)
#       invoice = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-10 00:52:09 UTC")
#       invoice1 = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-11 00:54:09 UTC")
#       invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-10 00:54:03 UTC")
#       invoice3 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-10 00:51:09 UTC")
#       transaction = create(:transaction, invoice_id: invoice.id, result: "success")
#       transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
#       transaction = create(:transaction, invoice_id: invoice2.id, result: "success")
#       transaction1 = create(:transaction, invoice_id: invoice3.id, result: "success")
#       invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)
#       invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 60, unit_price: 20)
#       invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 200, unit_price: 500)
#       invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 40, unit_price: 20)
#
#       get "/api/v1/merchants/revenue?date=2012-03-10 00:53:09"
#
#       revenue_json = JSON.parse(response.body)
#
#       expect(response).to be_success
#       expect(revenue_json["total_revenue"]).to eq("1025.0")
#     end
#   end
# end
