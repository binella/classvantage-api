module V1
  class RowsController < ApplicationController
    
    def create
      @row = Row.new(permitted_params[:row])
      
      if @row.save
        render 'show'
      else
        render :json => {:error => 'Error creating rubric row'}
      end
    end

    def update
      @row = Row.find(params[:id])
      # TODO: should not allow update of rubric_id
      if @row.update_attributes(permitted_params[:row])
        render :nothing => true
      else
        render :json => {:error => 'Error updating rubric row'}, :status => :not_acceptable
      end
      
    end
    
    def allowed_params
      [:criteria, :level1_description, :level2_description, :level3_description, :level4_description, :rubric_id]
    end


  end
end