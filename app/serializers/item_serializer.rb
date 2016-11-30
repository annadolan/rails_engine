class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id

  def unit_price
    ((object.unit_price.to_i) / 100.00).to_s
  end
end
