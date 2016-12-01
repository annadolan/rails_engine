require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "relationships" do
    it "belongs_to" do
      transaction = create(:transaction)

      expect(transaction).to respond_to(:transaction)
    end
  end
end
