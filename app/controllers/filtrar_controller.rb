class FiltrarController < ApplicationController

  layout "index"

  def caracteristica
    alternativas_array_not = Array.new
    @alternativas_escolhidas = Array.new
    params[:caracteristica].each do |caracteristica_atual, alternativa_escolhida|
      
      unless alternativa_escolhida[:id].empty?

        @alternativas_escolhidas.push(alternativa_escolhida[:id])
        caracteristica = Caracteristica.find(caracteristica_atual)
        caracteristica.alternativas.each do |alternativa_possivel|
          alternativas_array_not.push(alternativa_possivel.id) if alternativa_escolhida[:id] != alternativa_possivel.id.to_s
        end unless caracteristica.alternativas.nil?

      end
    end unless params[:caracteristica].nil?

    sql = "SELECT especies.id, especies.nome "
    sql += "FROM especies, alternativas_especies "
    sql += "WHERE especies.id = alternativas_especies.especie_id "
    sql += "and alternativas_especies.alternativa_id in ( "
    alternativas_array_not.each do |x|
      sql +=  x.to_s + ", "
    end
    sql += "0 )"

    especies_not = Especie.connection.execute(sql)

    especies_not_id = Array.new
    especies_not.each do |especie_not|
      especies_not_id.push(especie_not[0])
    end unless especies_not.nil?

    if especies_not.empty?
      @especies = Especie.find(:all, :include => [:generos], :order => 'IFNULL (generos.nome,"ZZZ"), IFNULL(especies.nome,"ZZZ")')
    else
      @especies = Especie.find(:all, :include => [:generos], :order => 'IFNULL (generos.nome,"ZZZ"), IFNULL(especies.nome,"ZZZ")' ,:conditions => ["especies.id NOT IN (?)", especies_not_id])
    end

    @naoespecies = Especie.find(:all, :include => [:generos], :order => 'IFNULL (generos.nome,"ZZZ"), IFNULL(especies.nome,"ZZZ")',:conditions => ["especies.id IN (?)", especies_not_id])
    @caracteristicas = Caracteristica.all
    
    #puts @alternativas_escolhidas
    
    respond_to do |format|
      format.html
    end
  end

protected

  def authorize

  end

end