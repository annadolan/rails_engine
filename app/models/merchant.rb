class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def find_revenue(date = nil)
    invoices.joins(:transactions)
    .merge(Invoice.date_format(date))
    .merge(Transaction.successful)
    .joins(:invoice_items)
    .sum("quantity * unit_price")
  end

  def self.find_total_revenue(date = nil)
    joins(invoices: [:invoice_items, :transactions])
    .merge(Invoice.date_format(date))
    .merge(Transaction.successful)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.rank_by_items_sold(quantity_input = nil)
    joins(invoices: [:transactions, :invoice_items])
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(invoice_items.quantity) DESC")
    .limit(quantity_input)
  end

  def favorite_customer
    customers.joins(:transactions)
    .merge(Transaction.successful)
    .group(:id).order("count(*) desc").first
  end
end
