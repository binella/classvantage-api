module V1
  class SubjectsController < ApplicationController
    
    def index
      @subjects = Subject.all
      fresh_when Subject.maximum(:updated_at)
    end

    def show
      @subject = Subject.includes(:strands).find params[:id]
    end
    
    def create
      @subject = Subject.new permitted_params[:subject]
      #authorize! :create, @subject
      
      if @subject.save
        render 'show'
      else
        render :json => {:error => "Error creating subject"}, :status => :not_acceptable
      end
    end
    
    def update
      @subject = Subject.find(params[:id])
      #authorize! :update, @subject
      
      if Subject.update(params[:id], permitted_params[:subject])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating subject"}, :status => :not_acceptable
      end
    end
    
    def destroy
      @subject = Subject.find(params[:id])
      #authorize! :destroy, @subject
    
      if @subject.destroy
        render :json => {:success => true}
      else
        render :json => {:error => @subject.errors.full_messages}, :status => :not_acceptable
      end
      
    end

    def allowed_params
      [:title, :curriculum_id, :strand_ids, {:strand_ids => []}]
    end

  end
end