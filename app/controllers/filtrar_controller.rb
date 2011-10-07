class FiltrarController < ApplicationController

  layout "index"
  
  def caracteristica

    unless params["caracteristica"].nil?

      sql = "SELECT especies.nome, especies.id "
      sql += "FROM especie, alternativas_especies "
      sql += "WHERE especies.id = alternativa_especie.id and ("

      params["caracterisitca"].each do |key,value|
        puts "Hash inner key=>#{key}"
        puts "Hash inner value=>#{value}"
        #sql += " alternativas_especies = " + value
      end

      sql += " alternativas_especies = 0 )"

      @especies = Especie.connection.execute(sql)
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
