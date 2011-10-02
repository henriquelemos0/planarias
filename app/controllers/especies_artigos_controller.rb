class EspeciesArtigosController < ApplicationController

  def index
    @especie = Especie.find(params[:id])
    @artigos = Artigo.find(@especie.artigos)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def create
    @especie = Especie.find(params[:especie_id])
    @artigo = Artigo.find(params[:artigo_id]['id'])
    if !@especie.artigos.include?(@artigo)
      @especie.artigos.push(@artigo)
      @especie.save!
      @salvo = true
    end
    respond_to do |format|
      if @salvo
        flash[:notice] = "Artigo adicionado à espécie."
        format.html { redirect_to(:back) }
      else
        flash[:notice] = "Erro, verifique se o artigo já foi adicionado à espécie."
        format.html { redirect_to(:back) }
      end
    end
  end

  def destroy
    especie = Especie.find(params[:especie_id])
    artigo = Artigo.find(params[:artigo_id])

    especie.artigos.delete(artigo)

    respond_to do |format|
      flash[:notice] = "Artigo excluído com sucesso."
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end
  end

end
