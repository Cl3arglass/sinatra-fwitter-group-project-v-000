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
   @tweet = Tweet.create(params)
   @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
   @song.genre_ids = params[:genres]
   @song.save

   flash[:message] = "Successfully created song."

   redirect("/songs/#{@song.slug}")
 end

end
