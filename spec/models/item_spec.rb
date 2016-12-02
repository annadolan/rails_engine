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

  describe ".dollar_to_cents_one" do
    it "turns dollar into cents" do
      item = create(:item, unit_price: 83333)

      expect(Item.dollar_to_cents_one("833.33").id).to eq(item.id)
    end
  end

  describe ".rank_by_items_sold" do
    it "returns items ranked by total number of items sold" do
      item = create(:item)
      item1 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id, quantity: 2)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 600)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")

      expect(Item.rank_by_items_sold.first.id).to eq(item1.id)
      expect(Item.rank_by_items_sold.last.id).to eq(item.id)
    end
    it "returns number of items included in params" do
      item = create(:item)
      item1 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id, quantity: 2)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 600)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")

      expect(Item.rank_by_items_sold(2).length).to eq(2)
      expect(Item.rank_by_items_sold(1).length).to eq(1)
    end
  end

  describe ".best_day" do
    it "returns the date with most successful transactions" do
      item1, item2 = create_list(:item, 2)
      invoice1 = create(:invoice, created_at: '2012-03-11 00:54:09 UTC')
      invoice2 = create(:invoice, created_at: '2012-03-11 00:54:09 UTC')
      invoice3 = create(:invoice, created_at: '2011-03-11 00:54:09 UTC')
      invoice_items = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, item_id: item1.id)
      invoice_items1 = create(:invoice_item, invoice_id: invoice2.id, quantity: 10, item_id: item2.id)
      invoice_items2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 10, item_id: item2.id)

      expect(item1.best_day.created_at).to eq(invoice2.created_at.to_datetime)
    end
  end

  describe ".most_revenue" do
    it "returns top x items ranked by total revenue" do
      item = create(:item)
      item1 = create(:item)
      item2 = create(:item)
      invoice = create(:invoice)
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 100, unit_price: 20)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id, quantity: 50, unit_price: 30)
      invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 50, unit_price: 60)
      invoice_item = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 100, unit_price: 15)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")

      expect(Item.most_revenue(2).first.id).to eq(item1.id)
      expect(Item.most_revenue.last.id).to eq(item2.id)
      expect(Item.most_revenue(2).last.id).to eq(item.id)
      expect(Item.most_revenue(2).length).to eq(2)
    end
  end
end
