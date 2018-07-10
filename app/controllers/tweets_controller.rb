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
  if params["Tweet"].empty?
    redirect "tweets/new"
  else
   @tweet = Tweet.create(:content => params["Tweet"])
   @user = User.find_or_create_by(session["user_id"])
   @tweet.user_id = @user.id
   @tweet.save
   redirect("/users/#{@user.slug}")
  end
 end

  get "/tweets/:id" do
    @tweet = Tweet.find_by(params[:id])

    erb :"tweets/show_tweet"
  end

end
