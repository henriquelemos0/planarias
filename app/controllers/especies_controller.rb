class EspeciesController < ApplicationController
  # GET /especies
  # GET /especies.xml
  def index
    @especies = Especie.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @especies }
    end
  end

  # GET /especies/1
  # GET /especies/1.xml
  def show
    @especie = Especie.find(params[:id])
    @municipios = @especie.municipios
    @especie_imagens = @especie.especie_imagens
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @especie }
    end
  end

  # GET /especies/new
  # GET /especies/new.xml
  def new
    @especie = Especie.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @especie }
    end
  end

  # GET /especies/1/edit
  def edit
    @especie = Especie.find(params[:id])
    @municipios = @especie.municipios
    @especie_imagens = @especie.especie_imagens
  end

  # POST /especies
  # POST /especies.xml
  def create
    @especie = Especie.new(params[:especie])

    respond_to do |format|
      if @especie.save
        flash[:notice] = 'Especie was successfully created.'
        format.html { redirect_to(@especie) }
        format.xml  { render :xml => @especie, :status => :created, :location => @especie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @especie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /especies/1
  # PUT /especies/1.xml
  def update
    @especie = Especie.find(params[:id])

    respond_to do |format|
      if @especie.update_attributes(params[:especie])
        flash[:notice] = 'Especie was successfully updated.'
        format.html { redirect_to(@especie) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @especie.errors, :status => :unprocessable_entity }
      end
    end
  end

  def updateCaracteristicas

    @especie = Especie.find(params[:especie_id])
    @alternativas = @especie.alternativa.all
    @alternativas.delete.all

    @especie.alternativas.push(@alternativas)

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

  # DELETE /especies/1
  # DELETE /especies/1.xml
  def destroy
    @especie = Especie.find(params[:id])
    @especie.destroy

    respond_to do |format|
      format.html { redirect_to(especies_url) }
      format.xml  { head :ok }
    end
  end
  
end
