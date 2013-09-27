module V1
  class MeController < ApplicationController
    
    def show
      @user = current_user
    end
    
  end
end