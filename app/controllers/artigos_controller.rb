class ArtigosController < ApplicationController
  # GET /artigos
  # GET /artigos.xml
  def index
    @artigos = Artigo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artigos }
    end
  end

  # GET /artigos/1
  # GET /artigos/1.xml
  def show
    @artigo = Artigo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artigo }
    end
  end

  # GET /artigos/new
  # GET /artigos/new.xml
  def new
    @artigo = Artigo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artigo }
    end
  end

  # GET /artigos/1/edit
  def edit
    @artigo = Artigo.find(params[:id])
  end

  # POST /artigos
  # POST /artigos.xml
  def create
    @artigo = Artigo.new(params[:artigo])

    respond_to do |format|
      if @artigo.save
        flash[:notice] = 'Artigo foi criado(a) com sucesso.'
        format.html { redirect_to(@artigo) }
        format.xml  { render :xml => @artigo, :status => :created, :location => @artigo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @artigo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /artigos/1
  # PUT /artigos/1.xml
  def update
    @artigo = Artigo.find(params[:id])

    respond_to do |format|
      if @artigo.update_attributes(params[:artigo])
        flash[:notice] = 'Artigo foi atualizado(a) com sucesso.'
        format.html { redirect_to(@artigo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artigo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artigos/1
  # DELETE /artigos/1.xml
  def destroy
    @artigo = Artigo.find(params[:id])
    @artigo.destroy

    respond_to do |format|
      format.html { redirect_to(artigos_url) }
      format.xml  { head :ok }
    end
  end
end
