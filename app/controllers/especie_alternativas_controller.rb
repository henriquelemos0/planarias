class EspecieAlternativasController < ApplicationController

  def index
    @especie = Especie.find(params[:especie_id])
    @caracteristicas = Caracteristica.all
    @alternativas = Alternativa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def update

    @especie = Especie.find(params[:especie_id])
    @alternativas = @especie.alternativa.all
    @alternativas.delete.all

    @especie.alternativas.push(@alternativa)
    
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

end