require 'csv' 

file=CSV.read(ARGV(0))

CSV.foreach(CSV) do |row|
	r1=`curl –form "file=@/home/elsyser/testing.csv" #{row[5]}/sums`==528
	r2=`curl –form "file=@/home/elsyser/testing.csv" #{row[5]}/filters`==272
	r3=`curl –form "file=@/home/elsyser/testing.csv" #{row[5]}/intervals`==525
	r4= `curl –form "file=@/home/elsyser/testing.csv" #{row[5]}/lin_regressions`=="1.000000, 0.000000"
	r=r1&&r2&&r3&&r4
	p row[1]+row[2]+row[3]+row[4]+r
