module V1
  class PagesController < ApplicationController
    
    def index
      @pages = current_user.default_gradebook.pages.order("created_at DESC")
    end
    
    def show
      @page = Page.find(params[:id])
    end
    
    def create
      @page = current_user.default_gradebook.pages.build(permitted_params[:page])

      if @page.save
        render 'show'
      else
        render :json => { :error => "Error creating page: #{@page.errors.full_messages}" }
      end
    end
    
    def update
      @page = Page.find(params[:id])
      
      if @page.update(permitted_params[:page])
        render 'show'
      else
        render :json => { :error => "Error updating page"}
      end
    end
    
    
    def allowed_params
      [:title, :grade, :subject_id, :students_attributes => [:full_name]]
    end
    
  end
end