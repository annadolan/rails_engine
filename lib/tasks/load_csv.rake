require 'csv'


namespace :load_csv do
  desc "TODO"
  task customers: :environment do
   csv_text = File.read('./data/customers.csv')
   csv = CSV.parse(csv_text, :headers => true)
   csv.each { |row| Customer.create!(row.to_hash) }
  end

  desc "TODO"
  task invoices: :environment do
    csv_text = File.read('./data/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Invoice.create!(row.to_hash) }
  end

  desc "TODO"
  task invoice_items: :environment do
    csv_text = File.read('./data/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| InvoiceItem.create!(row.to_hash) }
  end

  desc "TODO"
  task items: :environment do
    csv_text = File.read('./data/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Item.create!(row.to_hash) }
  end

  desc "TODO"
  task merchants: :environment do
    csv_text = File.read('./data/merchants.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Merchant.create!(row.to_hash) }
  end

  desc "TODO"
  task transactions: :environment do
    csv_text = File.read('./data/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each { |row| Transaction.create!(row.to_hash) }
  end

  task :all => [:customers, :merchants, :invoices, :items, :transactions, :invoice_items]

end
