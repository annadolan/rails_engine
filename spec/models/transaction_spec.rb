require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "relationships" do
    it "belongs to invoice" do
      transaction = create(:transaction)

      expect(transaction).to respond_to(:invoice)
    end
  end
end
