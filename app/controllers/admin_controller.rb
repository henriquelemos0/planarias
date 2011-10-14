# -*- encoding : utf-8 -*-
class AdminController < ApplicationController

  def index
    
  end

  def login
    if request.post?
      usuario = Usuario.authenticate(params[:nome], params[:password])
      if usuario
        session[:usuario_id] = usuario.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      else
        flash[:notice] = "Usuario ou senha invalidos!"
      end
    end
  end

  def logout
    session[:usuario_id] = nil
    flash[:notice] = "Sessao encerrada."
    redirect_to(:controller => 'buscar')
  end

  def authorize
    unless Usuario.find_by_id(session[:usuario_id])
      session[:original_uri] = request.fullpath
      redirect_to :controller => 'admin' , :action => 'login'
    end
  end

end
