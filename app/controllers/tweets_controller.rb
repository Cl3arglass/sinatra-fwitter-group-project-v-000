class TweetsController < ApplicationController
  # get '/tweets' do
  #   if logged_in?
  #   erb :'tweets/tweets'
  #   end
  # end

  get '/tweets/new' do
    erb :'tweets/create_tweet'
  end

end
