require 'csv'

csv_file = params[:file]
csv_file_path = csv_file.path


CSV.foreach(csv_file_path) do |row|
	r1 = `curl -F „file=@/home/elsyser/file.csv“ http://yourherokuapp/sums` == '' == ''
	r2 = `curl -F „file=@/home/elsyser/file.csv“ http://example.com/filters` == '' == ''
	r3 = `curl -F „file=@/home/elsyser/file.csv“ http://example.com/intervals` == '' == ''
	r4 = `curl -F „file=@/home/elsyser/file.csv“ http://example.com/lin_regressions`
end
