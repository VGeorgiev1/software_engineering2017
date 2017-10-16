require 'csv'
require 'time'

FILE_PATH = './A_04_Vencislav_Tashev.csv'
INITIAL_CURL_REQUEST = "curl -s --form \"file=@#{FILE_PATH}\""

# TODO: Implement it with a Hash, not with arrays
actions = %w(sums filters intervals lin_regressions)
expected = %w(51068.00 24758.00 1930.00 -0.000996,51.566565)

def is_heroku_url?(url_string)
  url_string.end_with?('herokuapp.com/')
end

def is_on_time?(current_date, max_date)
  current_date <= max_date
end

def get_actual_results(url_string, actions)
  actual_results = []

  actions.each do |action|
    request_url = url_string + action
    actual_result = `#{INITIAL_CURL_REQUEST} #{request_url}`.to_s
    actual_results.push actual_result
  end

  actual_results
end

def get_user_representation(user_info_hash)
  user_class = user_info_hash[1].strip.upcase
  user_number = user_info_hash[2]
  user_full_name = "#{user_info_hash[3].strip} #{user_info_hash[4].strip}"

  "#{user_full_name} (#{user_class}, #{user_number})"
end

date_format = '%d/%m/%Y %H:%M:%S'
deadline = DateTime.strptime '10/10/2017 23:59:59', date_format

CSV.foreach(ARGV[0], headers: true) do |row|
  url_string = row[5]

  unless url_string.nil?
    user_date = DateTime.strptime row[0], date_format
    user_info = get_user_representation row

    if is_on_time? user_date, deadline
      url_string = url_string.strip
      url_string << '/' unless url_string.end_with?('/')

      if is_heroku_url? url_string
        actual = get_actual_results url_string, actions
        result = expected == actual ? 1 : 0

        puts "#{user_info} has #{result}"
      end
    else
      puts "#{user_info} is late."
    end
  end
end
