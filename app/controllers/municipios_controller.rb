class MunicipiosController < ApplicationController
  # GET /municipios
  # GET /municipios.xml
  def index
    sql = "select Paises.nome, Estados.nome, Municipios.nome, Municipios.id "
    sql += "from Paises, Estados, Municipios "
    sql += "where Municipios.estado_id = Estados.id and Estados.pais_id = Paises.id "
    sql += "order by Paises.nome, Estados.nome, Municipios.nome"
    @municipios = Municipio.connection.execute(sql)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @municipios }
    end
  end

  # GET /municipios/1
  # GET /municipios/1.xml
  def show
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @municipio }
    end
  end

  # GET /municipios/new
  # GET /municipios/new.xml
  def new
    @municipio = Municipio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @municipio }
    end
  end

  # GET /municipios/1/edit
  def edit
    @municipio = Municipio.find(params[:id])
  end

  # POST /municipios
  # POST /municipios.xml
  def create
    @municipio = Municipio.new(params[:municipio])

    respond_to do |format|
      if @municipio.save
        flash[:notice] = 'Município foi criado com sucesso.'
        format.html { redirect_to(@municipio) }
        format.xml  { render :xml => @municipio, :status => :created, :location => @municipio }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /municipios/1
  # PUT /municipios/1.xml
  def update
    @municipio = Municipio.find(params[:id])

    respond_to do |format|
      if @municipio.update_attributes(params[:municipio])
        flash[:notice] = 'Município foi atualizado com sucesso.'
        format.html { redirect_to(@municipio) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @municipio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /municipios/1
  # DELETE /municipios/1.xml
  def destroy
    @municipio = Municipio.find(params[:id])
    @especies = @municipio.especies

    @destroyed = false
    if @especies.first.nil?
      @municipio.destroy
      @destroyed = true
    end

    respond_to do |format|
      if @destroyed
        flash[:notice] = 'Município excluído com sucesso.'
      else
        flash[:notice] = 'O municícipio não pode ser excluído devido a relação com a espécie ' + @especies.first.nome
      end
      format.html { redirect_to(municipios_url) }
      format.xml  { head :ok }
    end
  end

end
