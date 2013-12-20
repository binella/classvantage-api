module V1
  class MarksController < ApplicationController
    
    def create
      @mark = Mark.new(permitted_params[:mark])
      #authorize! :create, @mark
      
      if @mark.save
        render 'show'
      else
        render :json => {:error => 'Error creating mark'}
      end
    end
    
    def show
      @mark = Mark.find(params[:id])
    end
    

    def update
      @mark = Mark.find(params[:id])
      #authorize! :update, @mark
      if @mark.update_attributes(permitted_params[:mark])
        render :json => {:success => true} #'show'
      else
        render :json => {:error => 'Error saving mark'}
      end
    end
    
    def allowed_params
      [:assessment_id, :assessable_item_id, :assessable_item_type, :value]
    end


  end
end