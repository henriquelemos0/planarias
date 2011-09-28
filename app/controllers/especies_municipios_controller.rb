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
      format.html { redirect_to(:back) }
      #redirect_to :action => "edit", :id => 7
      format.xml  { head :ok }
    end
  end

end
