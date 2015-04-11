class SearchController < ApplicationController
  
  helper_method :print_tweet
  
  def print_tweet(tweet)
    screen_name = tweet["user"]["name"]
    text = tweet["text"]
    puts "#{screen_name} - #{text}"
    #puts JSON.pretty_generate(tweet)
  end
  
  def new
    baseurl = "https://api.twitter.com"
    path    = "/1.1/statuses/show.json"
    query   = URI.encode_www_form("id" => "266270116780576768")
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # If you entered your credentials in the first
    # exercise, no need to enter them again here. The
    # ||= operator will only assign these values if
    # they are not already set.
    consumer_key ||= OAuth::Consumer.new "ENTER IN EXERCISE 1", ""
    access_token ||= OAuth::Token.new "ENTER IN EXERCISE 1", ""

    # Issue the request.
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request

    # Parse and print the Tweet if the response code was 200
    tweet = nil
    if response.code == '200' then
      tweet = JSON.parse(response.body)
      print_tweet(tweet)
    end

  end
    
  def clear
  end
end
  
  
