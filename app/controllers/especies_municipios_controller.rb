# -*- encoding : utf-8 -*-
class EspeciesMunicipiosController < ApplicationController

  def index
    @especie = Especie.find(params[:id])
    @municipios = Municipio.find(@especie.municipios)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def create
    @especie = Especie.find(params[:especie_id])
    @municipio = Municipio.find(params[:municipio_id]['id'])
    if !@especie.municipios.include?(@municipio) 
      @especie.municipios.push(@municipio)
      @especie.save!
      @salvo = true
    end
    respond_to do |format|
      if @salvo
        flash[:notice] = "Município adicionado à espécie."
        format.html { redirect_to(:back) }
      else
        flash[:notice] = "Erro, verifique se o município já foi adicionado à espécie."
        format.html { redirect_to(:back) }
      end
    end
  end

  def destroy
    especie = Especie.find(params[:especie_id])
    municipio = Municipio.find(params[:municipio_id])

    especie.municipios.delete(municipio)

    respond_to do |format|
      flash[:notice] = "Município excluído com sucesso."
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end
  end

end
