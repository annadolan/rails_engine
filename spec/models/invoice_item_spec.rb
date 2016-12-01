require 'rails_helper'

describe InvoiceItem, type: :model do
   context "relationships" do
     it "belongs to item" do
       invoice_item = create(:invoice_item)

       expect(invoice_item).to respond_to(:item)
     end

     it "belongs to invoice" do
       invoice_item = create(:invoice_item)

       expect(invoice_item).to respond_to(:invoice)
     end
   end
end
