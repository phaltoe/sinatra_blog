class AuthorsController < ApplicationController
  

  get '/signup' do

    if !logged_in?
      @author = Author.new
      erb :"authors/new"
    else
      redirect "/posts"
    end
  end

  post '/signup' do
    @author = Author.new(params)

    if @author.save
      redirect '/login'
    else
      @author.errors
      erb :"/authors/new"
    end
  end

  get '/authors/:slug' do
    @author = Author.find_by_slug(params[:slug])

    erb :"/authors/show"
  end


end