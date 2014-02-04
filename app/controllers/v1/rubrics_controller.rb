module V1
  class RubricsController < ApplicationController
    
    # Use inherited_resources!!!!
    
    def index
      @rubrics = current_user.rubrics
    end
    
    def show
      @rubric = Rubric.find params[:id]
      authorize! :read, @rubric
    end
    
    def create
      if params[:rubric][:copy_from_id]
        @rubric_to_copy = Rubric.find params[:rubric][:copy_from_id]
        if @rubric_to_copy
          @rubric = @rubric_to_copy.dup
          @rubric.page_id = params[:rubric][:page_id]
          @rubric.save
          @rubric.overall_expectation_ids = @rubric_to_copy.overall_expectation_ids
          @rubric_to_copy.rows.each do |row|
            @rubric.rows.create :criteria => row[:criteria], :level1_description => row[:level1_description], :level2_description => row[:level2_description], :level3_description => row[:level3_description], :level4_description => row[:level4_description]
          end
        end
        
      else
        @rubric = Rubric.new permitted_params[:rubric]
      end
      
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
      @rubric = Rubric.find(params[:id])
      #authorize! :destroy, @rubric
    
      if @rubric.destroy
        render :json => {:success => true}
      else
        render :json => {:error => @rubric.errors.full_messages}, :status => :not_acceptable
      end
      
    end
    
    
    def allowed_params
      [:title, :description, :unit_id, :page_id, :custom_expectation, 
       :custom_expectation_enabled, :row_ids, 
       {:row_ids => []}, :overall_expectation_ids, {:overall_expectation_ids => []} ]
    end
    
  end
end