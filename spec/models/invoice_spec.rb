require 'rails_helper'

describe Invoice, type: :model do
  context "relationships" do
    it "belongs to merchant" do
     invoice = create(:invoice)

     expect(invoice).to respond_to(:merchant)
    end

   it "belongs to customer" do
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
  describe ".date_match" do
    it "returns matched date" do
      invoice = create(:invoice, created_at: '2012-03-11 00:54:09 UTC')

      expect(Invoice.date_match('2012-03-11 00:54:09 UTC').first.id).to eq(invoice.id)
    end
  end
end
