class TweetsController < ApplicationController
  # get '/tweets' do
  #   if logged_in?
  #   erb :'tweets/tweets'
  #   end
  # end

  get '/tweets/new' do
   if logged_in?
    erb :'tweets/create_tweet'
   else
    redirect "/login"
   end
  end

  post '/tweets' do
    binding.pry
   @tweet = Tweet.create(content: => params["Tweets"])
   @tweet.user = User.find_or_create_by(session["user_id"])

   @tweet.save


   redirect("/users/#{@tweet.user.slug}")
 end

end
