require 'rails_helper'

describe "invoices finder" do
  context "invoices/find?params" do
    it "returns specific invoice" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?status=#{invoice.status}"

      invoice_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_json["status"]).to eq(invoice.status)
    end
  end
  # context "invoices/find_all?params" do
  #   it "returns all matches to query" do
  #     create_list(:invoice, 3, status: "shipped")
  #     create_list(:invoice, 3, status: "cancelled")
  #
  #     get "/api/v1/invoices/find_by?status='shipped'"
  #
  #     invoices_json = JSON.parse(response.body)
  #
  #     expect(response.to be_success)
  #     expect(invoices_json.first["status"]).to eq("shipped")
  #     expect(invoices_json.count).to eq(3)
  #   end
  # end
end
