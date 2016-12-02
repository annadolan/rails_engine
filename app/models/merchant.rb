class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def find_revenue(date = nil)
    invoices.joins(:invoice_items, :transactions)
    .merge(Invoice.date_match(date))
    .merge(Transaction.successful)
    .sum("quantity * unit_price")
  end

  def self.find_total_revenue(date = nil)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Invoice.date_match(date))
    .merge(Transaction.successful)
    .sum("quantity * unit_price")
  end

  def self.rank_by_items_sold(quantity_input = nil)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(quantity) DESC")
    .limit(quantity_input)
  end

  def favorite_customer
    customers.joins(:transactions)
    .merge(Transaction.successful)
    .group(:id).order("count(*) DESC").first
  end

  def self.most_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order('sum(quantity * unit_price) DESC')
    .limit(quantity)
  end
end
