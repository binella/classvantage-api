module V1
  class MeController < ApplicationController
    
    def show
      @user = current_user
    end
    
    def update
      @user = current_user
      if @user.update_attributes(params.permit(:password, :password_confirmation))
        render :json => {:success => true}
      else
        render :json => {:error => @user.errors.full_messages}, :status => :not_acceptable
      end
    end
    
  end
end