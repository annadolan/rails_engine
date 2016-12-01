require 'rails_helper'

describe Item, type: :model do
  context "relationships" do
    it "belongs_to merchant" do
      item = create(:item)

      expect(item).to respond_to(:merchant)
    end

    it "has_many invoice_items" do
      item = create(:item)

      expect(item).to respond_to(:invoice_items)
    end

    it "has_many invoices" do
      item = create(:item)

      expect(item).to respond_to(:invoices)
    end
  end

  context "methods" do
    it "turns dollar into cents" do
      item = create(:item, unit_price: 83333)

      expect(Item.dollar_to_cents_one("833.33").id).to eq(item.id)
    end
  end
end
