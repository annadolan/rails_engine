class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    object/100
  end
end
