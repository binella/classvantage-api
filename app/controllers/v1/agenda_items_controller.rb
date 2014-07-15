module V1
  class AgendaItemsController < ApplicationController

    def index
      @agenda_items = AgendaItem.includes(:page => {:gradebook => :user}).where('users.id = ?', current_user.id).references(:page)
    end

    def show
      @agenda_item = AgendaItem.find params[:id]
    end
    
    def create
      @agenda_item = AgendaItem.new permitted_params[:agenda_item]
      #authorize! :create, @subject
      
      if @agenda_item.save
        render 'show'
      else
        render :json => {:error => "Error creating agenda item"}, :status => :not_acceptable
      end
    end
    
    def update
      @agenda_itam = AgendaItem.find(params[:id])
      #authorize! :update, @subject
      
      if AgendaItem.update(params[:id], permitted_params[:agenda_item])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating agenda item"}, :status => :not_acceptable
      end
    end
    
    def destroy
      @agenda_item = AgendaItem.find(params[:id])
      #authorize! :destroy, @subject
    
      if @agenda_item.destroy
        render :json => {:success => true}
      else
        render :json => {:error => @agenda_item.errors.full_messages}, :status => :not_acceptable
      end
      
    end

    def send_mail
      @agenda_ids = params[:agenda_item_ids]
      @students = Student.includes(:pages => :agenda_items).where('agenda_items.id' => @agenda_ids).references(:pages => :agenda_items)
      @students.each do |student|
        UserMailer.agenda_items_email(student, @agenda_ids, params[:note], params[:span]).deliver
      end
      render :json => {:success => true}
    end

    def allowed_params
      [:title, :description, :page_id, :due_date]
    end

  end
end