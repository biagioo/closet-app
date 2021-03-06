class UsersController < ApplicationController

	get '/signup' do
		@errors = []
		if logged_in?
			redirect to '/items'
		end
		erb :'/users/new'
	end

	post '/signup' do
		@user = User.create(params)
		if @user.valid?
			@user.save
			session["user_id"] = @user.id
			redirect to '/items'
		else
			@errors = @user.errors.full_messages
			erb :'/users/new'
		end
	end

	get '/login' do 
		if logged_in?
			redirect to '/items'
		end
		erb :'users/login'
	end

	post '/login' do 
		@user = User.find_by(:username => params[:username])

		if @user && @user.authenticate(params[:password])
      		session[:user_id] = @user.id
      		redirect to '/items'
    	else
			@error = "Invalid Username or Password. Please try again."
			erb :'/users/login'
		end
	end

	get '/logout' do 
		session.clear
		redirect '/'
	end

end