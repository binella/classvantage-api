module V1
  class PagesController < ApplicationController
    
    # TODO: use load_and_authorize_resource
    
    def index
      @pages = current_user.default_gradebook.pages.order("created_at DESC")
    end
    
    def show
      @page = Page.find(params[:id])
      authorize! :read, @page
    end
    
    def create
      if params[:page][:copy_students_from]
        params[:page][:student_ids] = Student.from_page(params[:page][:copy_students_from]).map{|student| student.id}
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
        render 'show'
      else
        render :json => { :error => "Error updating page"} #status?
      end
    end
    
    
    def allowed_params
      [
        :title, :grade, :subject_id, :student_ids => [],
        :students_attributes => [
            :full_name, :_destroy, :id
          ]
      ]
    end
    
  end
end