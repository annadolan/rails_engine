class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.dollar_to_cents_one(params)
    a = params.gsub!(/[^0-9A-Za-z]/, '')
    find_by(unit_price: a)
  end
end
