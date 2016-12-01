class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.dollar_to_cents_all(params)
    a = params.gsub!(/[^0-9A-Za-z]/, '')
    where(unit_price: a)
  end

  def self.dollar_to_cents_one(params)
    a = params.gsub!(/[^0-9A-Za-z]/, '')
    find_by(unit_price: a )
  end
end
