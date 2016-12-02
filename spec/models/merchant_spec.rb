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

  describe "find_revenue" do
    it "returns total revenue for merchant across all transactions" do
      merchant = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)

      expect(merchant.find_revenue).to eq(500.00)
    end
  end
  describe "find_total_revenue" do
    it "returns total revenue for date x across all merchants" do
      merchant = create(:merchant)
      merchant1 = create(:merchant)
      customer = create(:customer)
      invoice = create(:invoice, merchant: merchant, customer: customer, created_at: "2012-03-10 00:53:09 UTC")
      invoice1 = create(:invoice, merchant_id: merchant.id, created_at: "2012-03-11 00:54:09 UTC")
      invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-10 00:53:09 UTC")
      invoice3 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-10 00:53:09 UTC")
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction1 = create(:transaction, invoice_id: invoice3.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50, unit_price: 10)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 60, unit_price: 20)
      invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 200, unit_price: 500)
      invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 40, unit_price: 20)

      expect(Merchant.find_total_revenue).to eq(102500.0)
      expect(Merchant.find_total_revenue('2012-03-11 00:54:09 UTC')).to eq(1200.0)
    end
  end

  describe ".rank_by_items_sold" do
    it "returns merchants ranked by total number of items sold" do
      merchant = create(:merchant)
      merchant1 = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      transaction = create(:transaction, invoice_id: invoice.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice.id, quantity: 50)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 2)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 600)

      expect(Merchant.rank_by_items_sold.first.id).to eq(merchant1.id)
      expect(Merchant.rank_by_items_sold(10).first.id).to eq(merchant1.id)
      expect(Merchant.rank_by_items_sold(10).second.id).to eq(merchant.id)
    end
  end

  describe ".favorite_customer" do
    it "returns the customer who has most successful transactions" do
      merchant1, merchant2= create_list(:merchant, 2)
      customer1, customer2 = create_list(:customer, 2)
      invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id, customer_id: customer2.id)
      transaction = create(:transaction, invoice_id: invoice1.id, result: 'success')
      transaction = create(:transaction, invoice_id: invoice1.id, result: 'success')
      transaction = create(:transaction, invoice_id: invoice2.id, result: 'success')

      expect(merchant1.favorite_customer.id).to eq(customer1.id)
    end
  end

  describe ".most_revenue" do
    it "returns the top x merchants by total revenue" do
      merchant1, merchant2, merchant3 = create_list(:merchant, 3)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant3.id)
      transaction = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction = create(:transaction, invoice_id: invoice3.id, result: "success")
      invoice_item = create(:invoice_item, invoice_id: invoice1.id, quantity: 50)
      invoice_item = create(:invoice_item, invoice_id: invoice2.id, quantity: 2)
      invoice_item = create(:invoice_item, invoice_id: invoice3.id, quantity: 600)

      expect(Merchant.most_revenue(2).first.id).to eq(merchant3.id)
    end
  end
end
