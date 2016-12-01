require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "relationships" do
    it "has_many items" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:items)
    end
    it "has_many invoices" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:invoices)
    end
    it "has_many customers" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:customers)
    end
    it "has_many invoice_items" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:invoice_items)
    end
    it "has_many transactions" do
      merchant = create(:merchant)

      expect(merchant).to respond_to(:transactions)
    end
  end
end
