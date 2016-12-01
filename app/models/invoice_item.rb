class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.dollar_to_cents_all(params)
    where(unit_price: params.gsub!(/[^0-9A-Za-z]/, ''))
  end

  def self.dollar_to_cents_one(params)
    find_by(unit_price: params.gsub!(/[^0-9A-Za-z]/, ''))
  end
end
