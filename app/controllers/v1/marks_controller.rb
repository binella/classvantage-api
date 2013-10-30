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
        render 'show'
      else
        render :json => {:error => 'Error saving mark'}
      end
    end
    
    def allowed_params
      [:assessment_id, :row_id, :value]
    end


  end
end