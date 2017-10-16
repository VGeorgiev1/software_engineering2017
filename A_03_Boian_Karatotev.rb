require('csv')
require('time')

paths = ['sums/', 'filters/', 'intervals/', 'lin_regressions/']

# ARGV[1] is the test file
file = CSV.open(ARGV[0], 'r')
last_date = DateTime.strptime('10/10/2017 23:59:59', '%d/%m/%Y %H:%M:%S')

file.drop(1).each do |line|
  # if line[0] == 'Timestamp': pass

  # check timestamp
  date = DateTime.strptime(line[0], '%d/%m/%Y %H:%M:%S')
  if date >= last_date
    puts 'late'
    return ''
  else
    puts date
  end

  # validate class
  if line[1] != '' && line[2] != '' && line[3] != '' && line[4] != ''
    # bad = true
    return false
  end
  # validate the two links
  # run tests
  # puts line[0], line[1] # , line[2], line[3]
  # paths.each do |path|
  #   result = %x(`curl -F "file=@#{ARGV[1]}" #{line[4]}#{path}`)
  # end
end

# push to github repo, there is an invitation
# commit test file to repo too
