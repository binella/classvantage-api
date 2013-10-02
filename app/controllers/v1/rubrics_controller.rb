module V1
  class RubricsController < ApplicationController
    
    # Use inherited_resources!!!!
    
    def index
      
    end
    
    def show
      @rubric = Rubric.find params[:id]
    end
    
    def create
      @rubric = Rubric.new params[:rubric]
      
      if @rubric.save
        render 'show'
      else
        render :json => { :error => "Error creating rubric: #{@rubric.errors.full_messages}" }
      end
    end
    
    def update
      if Rubric.update(params[:id], permitted_params[:rubric])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating rubric"}
      end
    end
    
    def destroy
      
    end
    
    def self.model_class
      self.name.sub(/Controller/, '').sub(/.*::/, '').singularize.constantize
    end
    
    def permitted_params
      params.permit(self.class.model_class.to_s.underscore.to_sym => allowed_params)
    end
    
    def allowed_params
      [:title, :description, :unit_id]
    end
    
  end
end