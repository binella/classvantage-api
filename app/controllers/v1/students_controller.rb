module V1
  class StudentsController < ApplicationController
    
    # TODO: use load_and_authorize_resource
    
    def index
      @students = Student.all
    end
    
    def show
      @student = Student.find(params[:id])
      #authorize! :read, @student
    end
    
    def create
      @page = current_user.default_gradebook.pages.build(permitted_params[:page])
      
      @student = Student.new(permitted_params[:student])

      if @student.save
        render 'show'
      else
        render :json => { :error => "Error creating page: #{@page.errors.full_messages}" }
      end
    end
    
    def update
      @student = Student.find(params[:id])
      #authorize! :update, @student
      if @student.update(permitted_params[:student])
        render 'show'
      else
        render :json => { :error => "Error updating page"} #status?
      end
    end
    
    
    def allowed_params
      [
        :first_name, :last_name, :full_name, :page_ids => []
      ]
    end
    
  end
end