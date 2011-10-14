# -*- encoding : utf-8 -*-
class PaisesController < ApplicationController
  # GET /paises
  # GET /paises.xml
  def index
    @paises = Pais.find(:all, :order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paises }
    end
  end

  # GET /paises/1
  # GET /paises/1.xml
  def show
    @pais = Pais.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pais }
    end
  end

  # GET /paises/new
  # GET /paises/new.xml
  def new
    @pais = Pais.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pais }
    end
  end

  # GET /paises/1/edit
  def edit
    @pais = Pais.find(params[:id])
  end

  # POST /paises
  # POST /paises.xml
  def create
    @pais = Pais.new(params[:pais])

    respond_to do |format|
      if @pais.save
        flash[:notice] = 'País foi criado com sucesso.'
        format.html { redirect_to(@pais) }
        format.xml  { render :xml => @pais, :status => :created, :location => @pais }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pais.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paises/1
  # PUT /paises/1.xml
  def update
    @pais = Pais.find(params[:id])

    respond_to do |format|
      if @pais.update_attributes(params[:pais])
        flash[:notice] = 'País foi atualizado com sucesso.'
        format.html { redirect_to(@pais) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pais.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paises/1
  # DELETE /paises/1.xml
  def destroy
    @pais = Pais.find(params[:id])
    @estados = @pais.estados

    @destroyed = false
    if @estados.first.nil?
      @pais.destroy
      @destroyed = true
    end

    respond_to do |format|
      if @destroyed
        flash[:notice] = 'País excluído com sucesso.'
      else
        flash[:notice] = 'O país não pode ser excluído devido a relação com o estado ' + @estados.first.nome
      end
      format.html { redirect_to(paises_url) }
      format.xml  { head :ok }
    end
  end
end
