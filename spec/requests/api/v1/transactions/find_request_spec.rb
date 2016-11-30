require 'rails_helper'

describe "transactions find" do
  context "transactions/find?params" do
    it "returns item by specified param" do
      transaction = create(:transaction, result: "failed")

      get "/api/v1/transactions/find?result=#{transaction.result}"

      item_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(item_json["result"]).to eq("failed")
    end
  end

  context "transactions/find_all?params" do
    it "returns multiple transactions by params" do
      transaction1 = create_list(:transaction, 3, result: "good")
      transaction2 = create_list(:transaction, 3, result: "bad")

      get "/api/v1/transactions/find_all?result=good"

      transaction_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction_json.first["result"]).to eq("good")
      expect(transaction_json.count).to eq(3)
    end
  end
end
