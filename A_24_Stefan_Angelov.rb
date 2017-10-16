require 'csv'
file = ARGV[0]
print file.superclass

#file_path = file.path
=begin
CSV.foreach(file_path) do |row|
	heroku_path = row[4]
	r1 = `curl -F "file=@/home/elsyser/11a/tp/hw1_tp.csv "` + heroku_path
	puts r1
end
=end
