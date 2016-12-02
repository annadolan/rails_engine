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

  describe ".dollar_to_cents_one" do
    it "converts dollars to cents" do
      invoice_item = create(:invoice_item, unit_price: 83333)

      expect(InvoiceItem.dollar_to_cents_one("833.33").id).to eq(invoice_item.id)
    end
  end
  
  describe ".dollar_to_cents_all" do
    it "converts dollars to cents" do
      invoice_item = create(:invoice_item, unit_price: 83333)

      expect(InvoiceItem.dollar_to_cents_all("833.33").first.id).to eq(invoice_item.id)
    end
  end
end
