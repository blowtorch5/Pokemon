require 'csv'

Pokemon.delete_all
Ablity.delete_all
Region.delete_all
Generation.delete_all

filename = Rails.root.join("db/pokemon-data.csv")

puts "Successfully opened #{filename}"

csv_data = File.read(filename)
