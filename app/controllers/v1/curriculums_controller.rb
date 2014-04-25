module V1
  class CurriculumsController < ApplicationController
    
    def index
      @curriculums = Curriculum.all
      fresh_when Curriculum.maximum(:updated_at)
    end

    def show
      @curriculum = Curriculum.includes(:subjects => [{:strands => :units}]).find params[:id]
    end
    
    def update
      @curriculum = Curriculum.find(params[:id])
      #authorize!
      if @curriculum.update_attributes(permitted_params[:curriculum])
        render :nothing => true
      else
        render :json => {:error => "Error updating curriculum"}, :status => :not_acceptable
      end
    end

    def allowed_params
      [:subject_ids, {:subject_ids => []}]
    end

  end
end