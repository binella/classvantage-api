module V1
  class ChecklistItemsController < ApplicationController
    
    def create
      @checklist_item = ChecklistItem.new(permitted_params[:checklist_item])
      
      if @checklist_item.save
        render 'show'
      else
        render :json => {:error => 'Error creating checklist item'}
      end
    end

    def update
      @checklist_item = ChecklistItem.find(params[:id])
      # TODO: should not allow update of checklist_id
      if @checklist_item.update_attributes(permitted_params[:checklist_item])
        render :nothing => true
      else
        render :json => {:error => 'Error updating checklist item'}
      end
      
    end
    
    def allowed_params
      [:criteria, :checklist_id]
    end


  end
end