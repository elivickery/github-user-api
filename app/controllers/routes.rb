require 'sinatra'
require 'sinatra/cross_origin'
require 'httparty'

ACCESS_TOKEN = ENV['ACCESS_TOKEN']

get '/followers' do
    cross_origin
    username = params[:username]
    page = params[:page]

    followers_url = 'https://api.github.com/users/' + username + '/followers?per_page=30&page=' + page + '&access_token=' + ACCESS_TOKEN

    followers = HTTParty.get(followers_url).parsed_response

    followers.to_json

end

get '/user' do
    cross_origin
    username = params[:username]

    user_url = 'https://api.github.com/users/' + username + '?access_token=' + ACCESS_TOKEN

    user = HTTParty.get(user_url).parsed_response

    user.to_json
end

get '/' do
    cross_origin
    "Error: you must enter a username."
end
