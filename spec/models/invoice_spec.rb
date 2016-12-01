require 'rails_helper'

describe Invoice, type: :model do
  context "relationships" do
    it "belongs to merchant" do
     invoice = create(:invoice)

     expect(invoice).to respond_to(:merchant)
    end

   it "has many customer" do
     invoice = create(:invoice)

     expect(invoice).to respond_to(:customer)
    end

    it "has many transactions" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:transactions)
    end

    it "has many invoice_items" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:invoice_items)
    end
    
    it "has many items" do
      invoice = create(:invoice)

      expect(invoice).to respond_to(:items)
    end
  end
end
