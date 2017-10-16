require 'csv'
file = File.new(ARGV[0])
r1 = 0
def sum(r1)
	if r1 == "6.00"
		puts '1'
	elsif r1 == " "
		puts "sory"
	else
		puts '0'
	end
end
CSV.foreach(file.path) do |row|
	heroku_path = row[5] + '/sums'
	r1 = "curl -s -F \"file=@/home/elsyser/11a/tp/basic.csv\" " + heroku_path
	r1 = `#{r1}`
	sum(r1)
end
