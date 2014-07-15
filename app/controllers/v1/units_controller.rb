module V1
  class UnitsController < ApplicationController
    
    def index
      curriculum = Curriculum.find_by_title current_user.province
      curriculum = Curriculum.find(1) unless curriculum
      parent_c = curriculum.parent_curriculum
      @units = curriculum.units.with_subject.scoped
      @units.concat parent_c.units.with_subject.scoped if parent_c
      
      if parent_c
        fresh_when [curriculum.units.maximum(:updated_at), parent_c.units.maximum(:updated_at)].max
      else
        fresh_when curriculum.units.maximum(:updated_at)
      end
      
    end
    
    def show
      @unit = Unit.with_subject.find(params[:id])
    end
    
    def create
      @unit = Unit.new permitted_params[:unit]
      
      if @unit.save
        render 'show'
      else
        render :json => {:error => "Error creating the unit"}, :status => :not_acceptable
      end
    end

    def update
      @unit = Unit.find(params[:id])
      #authorize! :update, @unit
      if @unit.update_attributes(permitted_params[:unit])
        render 'show'
      else
        render :json => {:error => 'Error saving the unit'}
      end
    end
    
    def allowed_params
      [{:overall_expectation_ids => []}, :overall_expectation_ids, :title, :grade, :strand_id]
    end

  end
end