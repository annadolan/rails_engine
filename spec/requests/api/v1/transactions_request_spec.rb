require 'rails_helper'

describe "transactions endpoints" do
  context 'GET /transactions' do
    it "returns a list of all transactions" do
      create_list(:transaction, 3)

      get "/api/v1/transactions"

      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq(3)
    end
  end
  context 'GET /transactions/:id' do
    it "returns a single transaction" do
      transaction = create(:transaction, result: "success")

      get "/api/v1/transactions/#{transaction.id}"

      transaction_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_json["result"]).to eq("success")
    end
  end
end
