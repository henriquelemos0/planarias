# -*- encoding : utf-8 -*-
class EspecieImagensController < ApplicationController

  def imagem
    @especie_imagem = EspecieImagem.find(params[:id])
    send_data(@especie_imagem.data,
              :filename => @especie_imagem.nome,
              :type => @especie_imagem.content_type,
              :disposition => "inline")
  end

  # GET /especie_imagens
  # GET /especie_imagens.xml
  def index
    @especie = Especie.find(params[:especie_id])
    @especie_imagens = @especie.especie_imagens

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especie_imagens }
    end
  end

  # GET /especie_imagens/1
  # GET /especie_imagens/1.xml
  def show
    @especie_imagem = EspecieImagem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @especie_imagem }
    end
  end

  # GET /especie_imgens/new
  # GET /especie_imgens/new.xml
  def new
    @especie_imagem = EspecieImagem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @especie_imagem }
    end
  end

  # GET /especie_imgens/1/edit
  def edit
    @especie_imagem = EspecieImagem.find(params[:id])
  end

  # POST /especie_imgens
  # POST /especie_imgens.xml
  def create
    @especie_imagem = EspecieImagem.new(params[:especie_imagem])

    respond_to do |format|
      if @especie_imagem.save
        flash[:notice] = 'Imagem salva com sucesso.'
        format.html { redirect_to(@especie_imagem) }
        format.xml  { render :xml => @especie_imagem, :status => :created, :location => @especie_imagem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @especie_imagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /especie_imgens/1
  # PUT /especie_imgens/1.xml
  def update
    @especie_imagem = EspecieImagem.find(params[:id])

    respond_to do |format|
      if @especie_imagem.update_attributes(params[:especie_imagem])
        flash[:notice] = 'Imagem foi atualizado(a) com sucesso.'
        format.html { redirect_to(@especie_imagem) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @especie_imagem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /especie_imgens/1
  # DELETE /especie_imgens/1.xml
  def destroy
    @especie_imagem = EspecieImagem.find(params[:id])
    @especie_imagem.destroy

    respond_to do |format|
      format.html { redirect_to(especie_imgens_url) }
      format.xml  { head :ok }
    end
  end
end
