module V1
  class OverallExpectationsController < ApplicationController
    
    def create
      @overall_expectation = OverallExpectation.new(permitted_params[:overall_expectation])
      
      if @overall_expectation.save
        render 'show'
      else
        render :json => {:error => 'Could not create overall expectation'} #status?
      end
    end
    
    def update
      @overall_expectation = OverallExpectation.find(params[:id])
      #authorize! :update, @overall_expectation
      if @overall_expectation.update_attributes(permitted_params[:overall_expectation])
        render :json => {:success => true}
      else
        render :json => {:error => 'ERROR'}
      end
    end
    
    def allowed_params
      [ :id, :code, :short_form, :long_form, :unit_id,
        :specific_expectation_ids => []
         ]
    end
    
  end
end