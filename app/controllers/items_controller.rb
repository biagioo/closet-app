class ItemsController < ApplicationController 

	
	get '/items' do 
		redirect '/login' if !session[:user_id]
		@user = User.find(session[:user_id])
		@items = Item.select{|item|item.user_id == @user.id}
		erb :'items/index'
	end

	get '/items/new' do 
		if Helpers.is_logged_in?(session)
			@user = Helpers.current_user(session)
			@errors = []
			erb :'items/new'
		else
			redirect '/'
		end
	end

	post '/items' do 
		@user = Helpers.current_user(session)
		@item = Item.new(clothing_type: params[:item][:clothing_type], brand: params[:item][:brand], size: params[:item][:size], user_id: @user.id)
		
		redirect '/' if !Helpers.is_logged_in?(session)
		if @item.valid? 
			@item.save
			redirect '/items'
		else
			@errors = @item.errors.full_messages
			erb :'items/new'
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


	get '/items/:id/edit' do 
		Helpers.find_item
		if @item
			erb :'items/edit'
		else
			redirect '/items'
		end
	end

	patch '/items/:id' do
		item = Item.find_by(id: params[:id])
		if item.update(params[:item])
			redirect "/items/#{item.id}"
		else
			redirect "/items/#{item.id}/edit"
		end
	end

	delete '/items/:id/delete' do 
		item = Item.find_by(id: params[:id])
			if item.destroy
				redirect '/items'
			else
				redirect "/items/#{item.id}"
			end
	end
	
end