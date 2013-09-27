class ApplicationController < ActionController::Base #API
  before_filter :cors_set_access_control_headers
  
  #doorkeeper_for :all, :except => [:options]
  
  respond_to :json

  def options 
    render :text => '', :content_type => 'text/plain'
  end

  private

  # Is this needed?
  #def authenticate_user!
    # Do Nothing
  #end

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
