require 'rails_helper'

describe Customer, type: :model do
   context "relationships" do
     it "has many invoices" do
       customer = create(:customer)

       expect(customer).to respond_to(:invoices)
     end

     it "has_many transactions" do
       customer = create(:customer)

       expect(customer).to respond_to(:transactions)
     end

     it "has_many merchants" do
       customer = create(:customer)

       expect(customer).to respond_to(:merchants)
     end
   end
   describe ".favorite_merchant" do
     it "returns merchant where customer has conducted most successful transactions" do
       customer1, customer2 = create_list(:customer, 2)
       merchant1, merchant2 = create_list(:merchant, 2)
       invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
       invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
       transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
       transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
       transaction = create(:transaction, invoice_id: invoice2.id, result: "success")

       expect(customer1.favorite_merchant.id).to eq(merchant1.id)
       expect(customer2.favorite_merchant.id).to eq(merchant2.id)
     end
   end
end
