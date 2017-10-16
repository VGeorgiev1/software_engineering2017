Tests = [
    {
        filePath: "./B_17_Martin_Datsev.csv",
        requests:[
            {
                url: "/sums",
                response: "11.00"
            },
            {
                url: "/intervals",
                response: "11.00"
            },
            {
                url: "/filters",
                response: "8.00"
            },
            {
                url: "/lin_regressions",
                response: "1.100000,0.000000"
            }
        ]
    }
]

require 'csv'

csv_text = File.read(ARGV[0])
csv = CSV.parse(csv_text, :headers => true)

students = [];

csv.each do |row|
    unless row[2].nil? && row[3].nil? && row[4].nil?
        students.push({
            name: row[3].to_s + " " + row[4].to_s,
            klas: row[1] =~ /[bBбБ]/ ? "B" : ( row[1] =~ /[aAаА]/ ? "A" : "?"),
            number: row[2],
            hurl: row[5]
        })
    end
end

students.sort_by! {|s| [s[:klas].to_s, s[:number].to_i] }

students.each do |s|
    result = "1";
    Tests.each do |test| 
        test[:requests].each do |req|
            res = `curl --form \"file=@#{test[:filePath]}\" #{s[:hurl]}#{req[:url]} 2>/dev/null`;        
            if(res != req[:response])
                result = "0";
            end
        end
    end
    printf "#{s[:klas]}%02d #{s[:name].ljust(22)} #{result}\n" % s[:number]
end
