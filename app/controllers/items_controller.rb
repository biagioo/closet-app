class ItemsController < ApplicationController 

	get '/items' do 
		redirect '/login' if !session[:user_id]
		@items = Item.all #adjust so that only clothes in users closet can be seen
		@user = User.find(session[:user_id])
		
		erb :'items/index'
	end

	get '/items/new' do 
		if Helpers.is_logged_in?(session)
			@user = Helpers.current_user(session)
			erb :'items/new'
		else
			redirect '/'
		end
	end

	post '/items' do 
		@user = Helpers.current_user(session)
		@item = Item.new(clothing_type: params[:clothing_type], brand: params[:brand], size: params[:size], user_id: @user.id)
		
		redirect '/' if !@user 
		if @item.valid? 
			@item.save
			redirect '/items'
		else
			redirect '/'
		end
	end

	get '/items/:id' do 
		@item = Item.find_by(id: params[:id])
		if @item
			erb :'items/show'
		else
			redirect '/items'
		end
	end

end