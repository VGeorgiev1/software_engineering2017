require 'csv'

url_file = ARGV[0]

CSV.foreach(url_file) do |row|
	hurl = row[4]

	p `curl -F "file=@sum.csv" #{hurl}/sums` == "55.00"
	p `curl -F "file=@filters.csv" #{hurl}/filters` == "00.00"
	
end
