class TransacationSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :credit_card_number, :credit_card_expiration_data, :result 
end
