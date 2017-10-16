require 'csv'

csv_file = argv[0]

result = 1


CSV.foreach(csv_file) do |row|
	result = 0
	
	current_url = row[5]
	
	r1 = `curl -F „file=@/home/elsyser/A_25_Stefan_Grozev.csv“ http://yourherokuapp/sums` == '' == ''
	r2 = `curl -F „file=@/home/elsyser/A_25_Stefan_Grozev.csv“ http://example.com/filters` == '' == ''
	r3 = `curl -F „file=@/home/elsyser/A_25_Stefan_Grozev.csv“ http://example.com/intervals` == '' == ''
	r4 = `curl -F „file=@/home/elsyser/A_25_Stefan_Grozev.csv“ http://example.com/lin_regressions` == '' == ''
end
