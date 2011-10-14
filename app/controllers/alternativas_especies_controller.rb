# -*- encoding : utf-8 -*-
class AlternativasEspeciesController < ApplicationController

  def edit
    @especie = Especie.find(params[:especie_id])
    @caracteristicas = Caracteristica.all
    @alternativas = Alternativa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def update_all
    especie = Especie.find(params[:especie_id])
    caracteristica = Caracteristica.find(params[:caracteristica_id])
    alternativa_nova = Alternativa.find(params[:alternativa_id]) unless params[:alternativa_id].empty?
    @alternativas = caracteristica.alternativas

    @alternativas.each do |alternativa|
      especie.alternativas.delete(alternativa)
    end
    
    especie.alternativas.push(alternativa_nova) unless params[:alternativa_id].empty?
    
    respond_to do |format|
      flash[:notice] = "Espécie alterada com sucesso."
      format.html { redirect_to(:back) }
    end
  end

end
