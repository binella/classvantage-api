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
      
    end
    
    def allowed_params
      [ # Only allowed to add/remove overall_expectations
        :overall_expectations_attributes => [
            :id, :_destroy, :code, :short_form, :long_form
          ]
      ]
    end
    
  end
end