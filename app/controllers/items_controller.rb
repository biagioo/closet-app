class ItemsController < ApplicationController 

	
	get '/items' do 
		redirect '/login' if !session[:user_id]
		@user = current_user
		@items = Item.select{|item|item.user_id == @user.id}
		erb :'items/index'
	end

	get '/items/new' do 
		if logged_in?
			@user = current_user
			@errors = []
			erb :'items/new'
		else
			redirect '/'
		end
	end

	post '/items' do 
		@user = current_user
		@item = Item.new(clothing_type: params[:item][:clothing_type], brand: params[:item][:brand], size: params[:item][:size], user_id: @user.id)
		
		redirect '/' if !logged_in?
		if @item.valid? 
			@item.save
			redirect '/items'
		else
			@errors = @item.errors.full_messages
			erb :'items/new'
		end
	end

	get '/items/:id' do 
		find_item
		if @item
			erb :'items/show'
		else
			redirect '/items'
		end
	end


	get '/items/:id/edit' do 
		find_item
		if @item
			erb :'items/edit'
		else
			redirect '/items'
		end
	end

	patch '/items/:id' do
		find_item
		if @item.update(params[:item])
			redirect "/items/#{@item.id}"
		else
			redirect "/items/#{@item.id}/edit"
		end
	end

	delete '/items/:id/delete' do 
		find_item
		if @item.destroy
			redirect '/items'
		else
			redirect "/items/#{@item.id}"
		end
	end
	
end