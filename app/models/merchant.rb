class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def find_total_revenue(date = nil)
    invoices.joins(:transactions)
    .merge(Invoice.date_format(date))
    .merge(Transaction.successful)
    .joins(:invoice_items)
    .sum("quantity * unit_price")
  end
end
