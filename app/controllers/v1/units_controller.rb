module V1
  class UnitsController < ApplicationController
    
    def index
      @units = Unit.with_subject.scoped #filter for curriculum
      fresh_when Unit.maximum(:updated_at)
        
    end
    
    def show
      @unit = Unit.with_subject.find(params[:id])
    end
    
    def create
      @unit = Unit.new permitted_params[:unit]
      
      if @unit.save
        render 'show'
      else
        render :json => {:error => "Error creating the unit"}, :status => :not_acceptable
      end
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
      [{:overall_expectation_ids => []}, :overall_expectation_ids, :title, :grade, :strand_id]
    end

  end
end