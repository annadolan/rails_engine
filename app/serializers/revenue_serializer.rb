class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    ((object.invoices.joins(:transactions).where(transactions: {result: "success"}).joins(:invoice_items).sum("quantity * unit_price"))/100)
  end
end
