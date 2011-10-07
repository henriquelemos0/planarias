class ListarController < ApplicationController

  layout "index"

  def especie
    @especies = Especie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def localizacao
    @paises = Pais.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paises }
    end
  end

  def pais
    @pais = Pais.find(params[:id])
    @estados = @pais.estados.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estados }
    end
  end

  def estado
    @estado = Estado.find(params[:id])
    @municipios = @estado.municipios.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @municipios }
    end
  end

  def municipio
    @municipio = Municipio.find(params[:id])
    @especies = @municipio.especies.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  def taxonomia
    @familias = Familia.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @familias }
    end
  end

  def familia
    @familia = Familia.find(params[:id])
    @subfamilias = @familia.subfamilias.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subfamilias }
    end
  end

  def subfamilia
    @subfamilia = Subfamilia.find(params[:id])
    @generos = @subfamilia.generos.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @generos }
    end
  end

  def genero
    @genero = Genero.find(params[:id])
    @especies = @genero.especies.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

protected

  def authorize

  end

end
