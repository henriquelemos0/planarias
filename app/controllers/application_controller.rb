# -*- encoding : utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "admin"
  before_filter :authorize, :except => :login

  
  helper :all # include all helpers, all the time
  
  # See ActionController::RequestForgeryProtection for details
  protect_from_forgery :secret => '12c083470e1237e6ad5faca4325a0f7'

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

protected
  def authorize
    unless Usuario.find_by_id(session[:usuario_id])
      session[:original_uri] = request.fullpath
      flash[:notice] = "Por favor, fazer login"
      redirect_to :controller => 'admin' , :action => 'login'
  end

end

end
