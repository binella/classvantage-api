module V1
  class StudentsController < ApplicationController
    
    # TODO: use load_and_authorize_resource
    
    def index
      @students = Student.includes(:parent_emails).in_workspace(current_user)
    end
    
    def show
      @student = Student.find(params[:id])
      #authorize! :read, @student
    end
    
    def create
      
      if params[:student][:parent_emails]
        @existing_students = Student.includes(:parent_emails).where('parent_emails.email_address' => permitted_params[:student][:parent_emails])
      end
      
      if @existing_students and not @existing_students.empty? and not params[:student][:force]
        render 'existing_students', :status => :multiple_choices
      else
        @student = Student.new(permitted_params[:student].merge({ :creator => current_user }))

        if @student.save
          render 'show'
        else
          render :json => { :error => "Error creating studen: #{@student.errors.full_messages}" }
        end
      end
    end
    
    def update
      @student = Student.find(params[:id])
      #authorize! :update, @student
      if @student.update(permitted_params[:student])
        render 'show'
      else
        render :json => { :error => "Error updating student"} #status?
      end
    end
    
    
    def allowed_params
      [
        :first_name, :last_name, :full_name, {:page_ids => []}, :parent_emails, {:parent_emails => []}
      ]
    end
    
  end
end