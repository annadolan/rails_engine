class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object.find_total_revenue)/100
  end
end
