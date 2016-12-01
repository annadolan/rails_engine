class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.dollar_to_cents_one(params)
    a = params.gsub!(/[^0-9A-Za-z]/, '')
    find_by(unit_price: a)
  end

  def self.rank_by_items_sold(quantity_input = nil)
    joins(invoices: :transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("sum(invoice_items.quantity) DESC")
    .limit(quantity_input)
  end

  def best_day
    invoices.joins(:invoice_items)
    .order('invoice_items.quantity DESC, invoices.created_at DESC')
    .first
  end
end
