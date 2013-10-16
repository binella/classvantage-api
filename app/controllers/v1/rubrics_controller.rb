module V1
  class RubricsController < ApplicationController
    
    # Use inherited_resources!!!!
    
    def index
      
    end
    
    def show
      @rubric = Rubric.find params[:id]
      authorize! :read, @rubric
    end
    
    def create
      @rubric = Rubric.new permitted_params[:rubric]
      
      if @rubric.save
        render 'show'
      else
        render :json => { :error => "Error creating rubric: #{@rubric.errors.full_messages}" }
      end
    end
    
    def update
      @rubric = Rubric.find(params[:id])
      authorize! :update, @rubric
      
      if Rubric.update(params[:id], permitted_params[:rubric])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating rubric"}
      end
    end
    
    def destroy
      
    end
    
    
    def allowed_params
      [:title, :description, :unit_id, :page_id]
    end
    
  end
end