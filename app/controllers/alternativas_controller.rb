class AlternativasController < ApplicationController

  def imagem
    @alternativas = Alternativa.find(params[:id])
    send_data(@alternativas.imagem,
              :filename => @alternativas.nome_imagem,
              :type => @alternativas.content_type,
              :disposition => "inline")
  end

  # GET /alternativas
  # GET /alternativas.xml
  def index
    @alternativas = Alternativa.all
    @caracteristicas = Caracteristica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alternativas }
    end
  end

  # GET /alternativas/1
  # GET /alternativas/1.xml
  def show
    @alternativa = Alternativa.find(params[:id])
    @caracteristica = @alternativa.caracteristica

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @alternativa }
    end
  end

  # GET /alternativas/new
  # GET /alternativas/new.xml
  def new
    @alternativa = Alternativa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alternativa }
    end
  end

  # GET /alternativas/1/edit
  def edit
    @alternativa = Alternativa.find(params[:id])
  end

  # POST /alternativas
  # POST /alternativas.xml
  def create
    @alternativa = Alternativa.new(params[:alternativa])

    respond_to do |format|
      if @alternativa.save
        flash[:notice] = 'Alternativa foi criado(a) com sucesso.'
        format.html { redirect_to(@alternativa) }
        format.xml  { render :xml => @alternativa, :status => :created, :location => @alternativa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alternativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alternativas/1
  # PUT /alternativas/1.xml
  def update
    @alternativa = Alternativa.find(params[:id])

    respond_to do |format|
      if @alternativa.update_attributes(params[:alternativa])
        flash[:notice] = 'Alternativa foi atualizado(a) com sucesso.'
        format.html { redirect_to(@alternativa) }
        format.xml  { render :xml => @alternativa, :status => :created, :location => @alternativa }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alternativa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alternativas/1
  # DELETE /alternativas/1.xml
  def destroy
    @alternativa = Alternativa.find(params[:id])
    @alternativa.destroy

    respond_to do |format|
      format.html { redirect_to(alternativas_url) }
      format.xml  { head :ok }
    end
  end
end
