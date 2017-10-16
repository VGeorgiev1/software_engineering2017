require 'csv'

csv_file_path = './A_17_Martin_Markov.csv'
hws_file_path = ARGV[0]

CSV.foreach(hws_file_path) do |row|
  print "#{row[3]} #{row[4]} #{row[1]} "
  print `curl -s -F "file=@A_17_Martin_Markov.csv" #{row[5]}/sums` == '55.00' &&
        `curl -s -F "file=@A_17_Martin_Markov.csv" #{row[5]}/filters` == '25.00' &&
        `curl -s -F "file=@A_17_Martin_Markov.csv" #{row[5]}/intervals` == '0.00' &&
        `curl -s -F "file=@A_17_Martin_Markov.csv" #{row[5]}/filters` == '1.000000,0.000000'
  print "\n"
end