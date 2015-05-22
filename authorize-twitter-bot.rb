require 'oauth'

puts "Enter the \"consumer key\" (or \"consumer token\"): "
consumer_key = gets
puts "Enter the \"consumer secret\": "
consumer_secret = gets

c = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => 'https://api.twitter.com'})
request_token = c.get_request_token

puts "Visit the following website, while logged into the bot's target account:"
puts "https://api.twitter.com/oauth/authorize?oauth_token=#{request_token.token}"
puts "When you're done authorizing the bot, paste the verification code here:"

verifier = gets
at = request_token.get_access_token(:oauth_verifier => verifier)

puts "All done! Here is the access token:"
puts at.params[:oauth_token]
puts "And here is the access token secret:"
puts at.params[:oauth_token_secret]