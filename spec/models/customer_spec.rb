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
end
