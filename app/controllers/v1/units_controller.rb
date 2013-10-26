module V1
  class UnitsController < ApplicationController
    
    def index
      @units = Unit.with_subject.scoped #filter for curriculum
      fresh_when Unit.maximum(:updated_at)
        
    end
    
    def show
      @unit = Unit.with_subject.find(params[:id])
    end
    

    def update
      @unit = Unit.find(params[:id])
      #authorize! :update, @unit
      if @unit.update_attributes(permitted_params[:unit])
        render 'show'
      else
        render :json => {:error => 'Error saving the unit'}
      end
    end
    
    def allowed_params
      [{:overall_expectation_ids => []}, :overall_expectation_ids]
    end


  end
end