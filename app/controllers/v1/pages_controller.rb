module V1
  class PagesController < ApplicationController
    
    def index
      @pages = current_user.default_gradebook.pages
    end
    
    def show
      @page = Page.find(params[:id])
    end
    
    def create
      @page = current_user.default_gradebook.pages.build(params[:page])
      
      if @page.save
        render 'show'
      else
        render :json => { :error => "Error creating page: #{@page.errors.full_messages}" }
      end
    end
    
    def update
      if Page.update(params[:id], permitted_params[:page])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating page"}
      end
    end
    
    
    def allowed_params
      [:title, :grade, :subject_id]
    end
    
  end
end