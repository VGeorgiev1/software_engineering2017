require 'csv'

def is_heroku_url(url)
  url.end_with? 'herokuapp.com/'
end

CSV.foreach(ARGV[0], headers: true) do |row|
  uri_string = row[5]

  if uri_string
    uri_string = uri_string.to_s.strip

    unless uri_string.end_with? '/'
      uri_string << '/'
    end

    if is_heroku_url(uri_string)
      sums_url = uri_string << 'sums'
      sums_expected = '51068.00'
      sums_actual = `curl --form "file=@/home/wencakisa/Downloads/mock_data.csv" #{sums_url}`.to_s

      filters_url = uri_string << 'filters'
      filters_expected = '51068.00'
      filters_actual = `curl --form "file=@/home/wencakisa/Downloads/mock_data.csv" #{filters_url}`.to_s

      intervals_url = uri_string << 'intervals'
      intervals_expected = '51068.00'
      intervals_actual = `curl --form "file=@/home/wencakisa/Downloads/mock_data.csv" #{intervals_url}`.to_s

      lin_regressions_url = uri_string << 'lin_regressions'
      lin_regressions_expected = '51068.00'
      lin_regressions_actual = `curl --form "file=@/home/wencakisa/Downloads/mock_data.csv" #{lin_regressions_url}`.to_s
    end
  end
end
