module V1
  class PagesController < ApplicationController
    
    # TODO: use load_and_authorize_resource
    
    def index
      @pages = current_user.default_gradebook.pages.includes(:agenda_items).order("created_at DESC")
    end
    
    def show
      @page = Page.with_rubrics.with_students_and_assessments.find(params[:id])
      authorize! :read, @page
      
      @assessments = Assessment.with_marks.for_students(@page.student_ids).for_rubrics_or_assignments_or_checklists(@page.rubric_ids, @page.assignment_ids, @page.checklist_ids)
      @rubrics = @page.rubrics.includes(:rows)
      @checklists = @page.checklists.includes(:checklist_items)
    end
    
    def create
      if params[:page][:copy_students_from]
        params[:page][:student_ids] = Student.from_page(params[:page][:copy_students_from]).map(&:id)
      end
      
      
      @page = current_user.default_gradebook.pages.build(permitted_params[:page])

      if @page.save
        render 'show'
      else
        render :json => { :error => "Error creating page: #{@page.errors.full_messages}" }
      end
    end
    
    def update
      @page = Page.find(params[:id])
      authorize! :update, @page
      if @page.update(permitted_params[:page])
        render :json => {:success => true}  #'show'
      else
        render :json => { :error => "Error updating page"} #status?
      end
    end
    
    def destroy
      @page = Page.find(params[:id])
      authorize! :destroy, @page
      if @page.destroy
        render :json => {:success => true}
      else
        render :json => {:error => @page.errors.full_messages}, :state => :not_acceptable
      end
    end
    
    def allowed_params
      [
        :title, :grade, :subject_id, {:student_ids => []}, :student_ids,
        :assignment_ids, {:assignment_ids => []},
        :rubric_ids, {:rubric_ids => []},
        :checklist_ids, {:checklist_ids => []},
        :agenda_item_ids, {:agenda_item_ids => []}
      ]
    end
    
  end
end