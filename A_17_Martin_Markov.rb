require 'csv'

csv_file_path = './A_17_Martin_Markov.csv'
hws_file_path = ARGV[0]

CSV.foreach(hws_file_path) do |row|
  puts "Time: #{row[0]} | Class: #{row[1]} | Number: #{row[2]} | First Name: #{row[3]} | Last Name: #{row[4]}"
end