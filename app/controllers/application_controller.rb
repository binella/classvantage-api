class ApplicationController < ActionController::Base #API
  # TODO: use Rack:Cors
  before_filter :cors_set_access_control_headers
  
  doorkeeper_for :all, :except => [:options, :register, :reset_password]
  
  respond_to :json

  rescue_from CanCan::AccessDenied do |exception|
    render :nothing => true, :status => :forbidden
  end
  

  def options 
    render :text => '', :content_type => 'text/plain'
  end
  
  def register
    @user = User.new params.permit :name, :email, :password, :province, :school
    if @user.save
      render :json => {:success => true}
    else
      render :json => {:error => @user.errors.full_messages}, :status => :not_acceptable
    end
  end

  def reset_password
    if params[:token]
      @user = User.reset_password_by_token :reset_password_token => params[:token], :password => params[:password], :password_confirmation => params[:password_confirmation]
      if @user.errors.messages.empty?
        render :json => {:success => true}
      else  
        render :json => {:error => @user.errors.full_messages}, :status => :not_acceptable
      end
    else
      @user = User.where(:email => params[:email]).first
      if @user and @user.send_reset_password_instructions
        render :json => {:success => true}
      else
        render :json => {:error => "Email address not found"}, :status => :not_acceptable
      end
    end
  end

  #rescue_from CanCan::AccessDenied do |exception|
  #  render :json => {:error => 'Access Denied'}, :status => ?
  #end

  # SHOULD THESE METHODS BE PRIVATE?
  
  def self.model_class
    self.name.sub(/Controller/, '').sub(/.*::/, '').singularize.constantize
  end
  
  def permitted_params
    params.permit(self.class.model_class.to_s.underscore.to_sym => allowed_params)
  end
  
  def allowed_params
    # To be overidden by subclasses
  end

  private

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = '*, X-Requested-With, X-Prototype-Version, Authorization, Content-Type'
      headers['Access-Control-Max-Age'] = "1728000"
  end



end
