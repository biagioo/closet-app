class UsersController < Sinatra::Base

	get '/signup' do
		if Helpers.is_logged_in?(session)
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
			redirect to '/signup'
		end
	end

end