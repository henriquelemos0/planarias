class MembrosController < ApplicationController

  def imagem
    @membros = Membro.find(params[:id])
    send_data(@membros.imagem,
              :filename => @membros.nome_imagem,
              :type => @membros.content_type,
              :disposition => "inline")
  end

  # GET /membros
  # GET /membros.json
  def index
    @membros = Membro.find(:all, :order => 'nome')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @membros }
    end
  end

  # GET /membros/1
  # GET /membros/1.json
  def show
    @membro = Membro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membro }
    end
  end

  # GET /membros/new
  # GET /membros/new.json
  def new
    @membro = Membro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membro }
    end
  end

  # GET /membros/1/edit
  def edit
    @membro = Membro.find(params[:id])
  end

  # POST /membros
  # POST /membros.json
  def create
    @membro = Membro.new(params[:membro])

    respond_to do |format|
      if @membro.save
        format.html { redirect_to @membro, notice: 'Membro foi criado com sucesso.' }
        format.json { render json: @membro, status: :created, location: @membro }
      else
        format.html { render action: "new" }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /membros/1
  # PUT /membros/1.json
  def update
    @membro = Membro.find(params[:id])

    respond_to do |format|
      if @membro.update_attributes(params[:membro])
        format.html { redirect_to @membro, notice: 'Membro foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @membro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membros/1
  # DELETE /membros/1.json
  def destroy
    @membro = Membro.find(params[:id])
    @membro.destroy

    respond_to do |format|
      format.html { redirect_to membros_url }
      format.json { head :ok }
    end
  end
end
