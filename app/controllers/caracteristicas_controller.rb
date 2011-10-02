class CaracteristicasController < ApplicationController
  # GET /caracteristicas
  # GET /caracteristicas.xml
  def index
    @caracteristicas = Caracteristica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @caracteristicas }
    end
  end

  # GET /caracteristicas/1
  # GET /caracteristicas/1.xml
  def show
    @caracteristica = Caracteristica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @caracteristica }
    end
  end

  # GET /caracteristicas/new
  # GET /caracteristicas/new.xml
  def new
    @caracteristica = Caracteristica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @caracteristica }
    end
  end

  # GET /caracteristicas/1/edit
  def edit
    @caracteristica = Caracteristica.find(params[:id])
  end

  # POST /caracteristicas
  # POST /caracteristicas.xml
  def create
    @caracteristica = Caracteristica.new(params[:caracteristica])

    respond_to do |format|
      if @caracteristica.save
        flash[:notice] = 'Característica foi criado(a) com sucesso.'
        format.html { redirect_to(@caracteristica) }
        format.xml  { render :xml => @caracteristica, :status => :created, :location => @caracteristica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @caracteristica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /caracteristicas/1
  # PUT /caracteristicas/1.xml
  def update
    @caracteristica = Caracteristica.find(params[:id])

    respond_to do |format|
      if @caracteristica.update_attributes(params[:caracteristica])
        flash[:notice] = 'Característica foi atualizado(a) com sucesso.'
        format.html { redirect_to(@caracteristica) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @caracteristica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /caracteristicas/1
  # DELETE /caracteristicas/1.xml
  def destroy
    @caracteristica = Caracteristica.find(params[:id])
    @caracteristica.destroy

    respond_to do |format|
      format.html { redirect_to(caracteristicas_url) }
      format.xml  { head :ok }
    end
  end
end
