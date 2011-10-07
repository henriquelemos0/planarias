class VerespecieController < ApplicationController

  layout "index"

  def show
    @especie = Especie.find(params[:id])
    @municipios = @especie.municipios
    @especie_imagens = @especie.especie_imagens
    @genero = @especie.generos
    @artigos = @especie.artigos

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @especie }
    end
  end

protected

  def authorize

  end

end
