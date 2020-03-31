class ItemsController < ApplicationController 

    get '/items' do 
        redirect '/login' if !session[:user_id]
        @items = Item.all 
        @user = User.find(session[:user_id])
        
        erb :'items/index'
    end

end