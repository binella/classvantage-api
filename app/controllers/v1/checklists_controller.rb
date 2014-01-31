module V1
  class ChecklistsController < ApplicationController
    
    # Use inherited_resources!!!!
    
    def index
      @checklists = current_user.checklists
    end
    
    def show
      @checklist = Checklist.find params[:id]
      #authorize! :read, @checklist
    end
    
    def create
      @checklist = Checklist.new permitted_params[:checklist]
      
      if @checklist.save
        render 'show'
      else
        render :json => { :error => "Error creating rubric: #{@checklist.errors.full_messages}" }
      end
    end
    
    def update
      @checklist = Checklist.find(params[:id])
      #authorize! :update, @checklist
      
      if Checklist.update(params[:id], permitted_params[:checklist])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating rubric"}
      end
    end
    
    def destroy
      @checklist = Checklist.find(params[:id])
      #authorize! :destroy, @rubric
    
      if @checklist.destroy
        render :json => {:success => true}
      else
        render :json => {:error => @rubric.errors.full_messages}, :status => :not_acceptable
      end
      
    end
    
    
    def allowed_params
      [:title, :description, :unit_id, :page_id, :custom_expectation, :custom_expectation_enabled, :checklist_item_ids, {:checklist_item_ids => []}, :overall_expectation_ids, {:overall_expectation_ids => []} ]
    end
    
  end
end