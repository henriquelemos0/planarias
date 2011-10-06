class EspecieGeneroController < ApplicationController

  def edit
    @especie = Especie.find(params[:especie_id])
    @genero = Caracteristica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def update

    especie = Especie.find(params[:especie_id])
    genero = Genero.find(params[:genero_id][:id])

    especie.generos.each do |g|
      especie.generos.delete(g)
    end

    especie.generos.push(genero)

    respond_to do |format|
        flash[:notice] = "Gênero associado à espécie"
        format.html { redirect_to(:back) }
    end
  end

end