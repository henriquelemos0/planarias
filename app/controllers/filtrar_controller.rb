class FiltrarController < ApplicationController

  layout "index"

  def caracteristica

    alternativas_array = Array.new
    params[:caracteristica].each do |id, val|
      alternativas_array.push(val[:id])
    end unless params[:caracteristica].nil?

    sql = "SELECT especies.id, especies.nome "
    sql += "FROM especies, alternativas_especies "
    sql += "WHERE especies.id = alternativas_especies.especie_id "
    sql += "and alternativas_especies.alternativa_id in ( "
    alternativas_array.each do |x|
      sql +=  x.to_s + ", " unless x.empty?
    end
    sql += "0 )"

    @especies = Especie.connection.execute(sql)

    especies_id = Array.new
    @especies.each do |especie|
      especies_id.push(especie[0])
    end unless @especies.nil?

    if @especies.empty?
      @naoespecies = Especie.find(:all, :order => 'nome')
    else
      @naoespecies = Especie.find(:all, :order => 'nome' ,:conditions => ["id NOT IN (?)", especies_id])
    end
    
    @caracteristicas = Caracteristica.all

    respond_to do |format|
      format.html
    end
  end

protected

  def authorize

  end

end