module V1
  class StrandsController < ApplicationController
    
    def index
      @strands = Strand.all
      fresh_when Strand.maximum(:updated_at)
    end

    def show
      @strand = Strand.find params[:id]
    end
    
    def create
      @strand = Strand.new permitted_params[:strand]
      #authorize! :create, @strand
      
      if @strand.save
        render 'show'
      else
        render :json => {:error => "Error creating strand"}, :status => :not_acceptable
      end
    end
    
    def update
      @strand = Strand.find(params[:id])
      #authorize! :update, @strand
      
      if Strand.update(params[:id], permitted_params[:strand])
        render :json => { :success => true }
      else
        render :json => { :error => "Error updating strand"}, :status => :not_acceptable
      end
    end
    
    def destroy
      @strand = Strand.find(params[:id])
      #authorize! :destroy, @strand
    
      if @strand.destroy
        render :json => {:success => true}
      else
        render :json => {:error => @strand.errors.full_messages}, :status => :not_acceptable
      end
      
    end

    def allowed_params
      [:title, :subject_id, :unit_ids, {:unit_ids => []}]
    end

  end
end