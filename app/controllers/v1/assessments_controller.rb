module V1
  class AssessmentsController < ApplicationController
    
    def create
      @assessment = Assessment.new(permitted_params[:assessment])
      #authorize! :create, @assessment
      
      if @assessment.save
        render 'show'
      else
        render :json => {:error => 'Error creating assessment'}
      end
    end
    
    def show
      @assessment = Assessment.find(params[:id])
    end
    

    def update
      @assessment = Assessment.find(params[:id])
      #authorize! :update, @assessment
      if @assessment.update_attributes(permitted_params[:assessment])
        render :json => {:success => true}  #'show'
      else
        render :json => {:error => 'Error saving the assessment'}
      end
    end
    
    def allowed_params
      [:assessable_id, :assessable_type, :student_id, :value]
    end


  end
end