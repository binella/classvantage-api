module V1
  class AssignmentsController < ApplicationController
    
    def show
      @assignment = Assignment.find params[:id]
    end
    
    def create
      @assignment = Assignment.new(permitted_params[:assignment])
      if @assignment.save
        render 'show'
      else
        render :json => {:error => 'Error creating assignment.'}
      end
    end
    
    def update
      @assignment = Assignment.find params[:id]
      #authorize! :update, @assignment
      if @assignment.update_attributes permitted_params[:assignment]
        render :json => {:success => true}
      else
        render :json => {:error => 'Error updating assignment.'}
      end
    end
    
    def allowed_params
      [:title, :assignment_type, :page_id]
    end
    
  end
end