class Helpers

    def self.current_user(session)
      @user = User.find(session[:user_id])
    end
  
    def self.is_logged_in?(session)
      !!session[:user_id]
    end
  
    # def self.find_item
    #   @item = Item.find_by(id: params[:id])
    # end

end