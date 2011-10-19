# -*- encoding : utf-8 -*-
class ListarController < ApplicationController

  layout "index"

  def especie    
    params['nome'].nil? ? @nome = '' : @nome = params['nome'].gsub('%', '\%').gsub('_', '\_')
    @especies = Especie.find(:all, :include => [:generos], :order => 'IFNULL (generos.nome,"ZZZ"), IFNULL(especies.nome,"ZZZ")', :conditions => ['especies.nome like ?', '%' + @nome + '%'])
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
    sql = "SELECT Familias.nome, Subfamilias.nome, Generos.nome, Generos.id "
    sql += "FROM Familias, Subfamilias, Generos "
    sql += "WHERE Familias.id = Subfamilias.familia_id and Subfamilias.id = Generos.subfamilia_id "
    sql += "ORDER BY Familias.nome, Subfamilias.nome, Generos.nome"
    @generos = Genero.connection.execute(sql)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @generos }
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
