class HomeController < ApplicationController
  
  layout "index"

  def index
    
  end

  def artigos
    @artigos = Artigo.find(:all, :order => 'nome')

    respond_to do |format|
      format.html
      format.xml  { render :xml => @artigos }
    end
  end

protected

  def authorize
    
  end

end
