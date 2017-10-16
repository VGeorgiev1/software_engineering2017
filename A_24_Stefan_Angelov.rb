require 'csv'
file = File.new(ARGV[0])
CSV.foreach(file.path) do |row|
	heroku_path = row[5] + '/sums'
	r1 = "curl -F \"file=@/home/elsyser/11a/tp/basic.csv\" " + heroku_path
	r1 = `#{r1}`
	if r1 == "6.00"
		puts '1'
	else
		puts '0'
	end
end
