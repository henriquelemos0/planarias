# -*- encoding : utf-8 -*-
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

  def equipe_imagem
    @membros = Membro.find(params[:id])
    send_data(@membros.imagem,
              :filename => @membros.nome_imagem,
              :type => @membros.content_type,
              :disposition => "inline")
  end

  def equipe
    @membros = Membro.find(:all, :order => 'nome')

    respond_to do |format|
      format.html
      format.xml  { render :xml => @membros }
    end
  end

  def sobre

  end

protected

  def authorize
    
  end

end
