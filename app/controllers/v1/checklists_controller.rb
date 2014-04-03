module V1
  class ChecklistsController < ApplicationController
    
    # Use inherited_resources!!!!
    
    def index
      @checklists = current_user.checklists.where("is_copy IS NULL")
    end
    
    def show
      @checklist = Checklist.find params[:id]
      #authorize! :read, @checklist
    end
    
    def create
      if params[:checklist][:copy_from_id]
        @checklist_to_copy = Checklist.find params[:checklist][:copy_from_id]
        if @checklist_to_copy
          @checklist = @checklist_to_copy.dup
          @checklist.page_id = params[:checklist][:page_id]
          @checklist.is_copy = true
          @checklist.save
          @checklist.overall_expectation_ids = @checklist_to_copy.overall_expectation_ids
          @checklist_to_copy.checklist_items.each do |checklist_item|
            @checklist.checklist_items.create :criteria => checklist_item[:criteria], :created_at => checklist_item[:created_at]
          end
        end
      else
        @checklist = Checklist.new permitted_params[:checklist]
      end
      
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