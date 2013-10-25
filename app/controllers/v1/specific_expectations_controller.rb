module V1
  class SpecificExpectationsController < ApplicationController
    
    def create
      @specific_expectation = SpecificExpectation.new(permitted_params[:specific_expectation])
      
      if @specific_expectation.save
        render 'show'
      else
        render :json => {:error => 'Could not create overall expectation'} #status?
      end
    end
    
    def update
      @specific_expectation = SpecificExpectation.find(params[:id])
      #authorize! :update, @overall_expectation
      if @specific_expectation.update_attributes(permitted_params[:specific_expectation])
        render :json => {:success => true}
      else
        render :json => {:erro => 'ERROR'}
      end
    end
    
    def allowed_params
      [ :code, :description, :example, :friendly_description, :overall_expectation_id
         ]
    end
    
  end
end