class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.dollor_to_cents(params)
   unit_price = params.gsub!(/[^0-9A-Za-z]/, '')
   find_by(unit_price: unit_price)
  end
end
