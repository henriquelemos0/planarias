class SubfamiliasController < ApplicationController
  # GET /subfamilias
  # GET /subfamilias.xml
  def index
    @subfamilias = Subfamilia.find(:all, :include => [:familia], :order => "familias.nome, subfamilias.nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subfamilias }
    end
  end

  # GET /subfamilias/1
  # GET /subfamilias/1.xml
  def show
    @subfamilia = Subfamilia.find(params[:id])
    @familia = Familia.find(@subfamilia.familia_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subfamilia }
    end
  end

  # GET /subfamilias/new
  # GET /subfamilias/new.xml
  def new
    @subfamilia = Subfamilia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subfamilia }
    end
  end

  # GET /subfamilias/1/edit
  def edit
    @subfamilia = Subfamilia.find(params[:id])
  end

  # POST /subfamilias
  # POST /subfamilias.xml
  def create
    @subfamilia = Subfamilia.new(params[:subfamilia])

    respond_to do |format|
      if @subfamilia.save
        flash[:notice] = 'Subfamília foi criado(a) com sucesso.'
        format.html { redirect_to(@subfamilia) }
        format.xml  { render :xml => @subfamilia, :status => :created, :location => @subfamilia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subfamilia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subfamilias/1
  # PUT /subfamilias/1.xml
  def update
    @subfamilia = Subfamilia.find(params[:id])

    respond_to do |format|
      if @subfamilia.update_attributes(params[:subfamilia])
        flash[:notice] = 'Subfamília foi atualizado(a) com sucesso.'
        format.html { redirect_to(@subfamilia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subfamilia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subfamilias/1
  # DELETE /subfamilias/1.xml
  def destroy
    @subfamilia = Subfamilia.find(params[:id])
    @generos = @subfamilia.generos

    @destroyed = false
    if @generos.first.nil?
      @subfamilia.destroy
      @destroyed = true
    end

    respond_to do |format|
      if @destroyed
        flash[:notice] = 'Subfamília excluído com sucesso.'
      else
        flash[:notice] = 'O subfamília não pode ser excluído devido a relação com o gênero ' + @generos.first.nome
      end
      format.html { redirect_to(subfamilias_url) }
      format.xml  { head :ok }
    end
  end
end
