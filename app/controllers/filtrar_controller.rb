class FiltrarController < ApplicationController

  layout "index"
  
  def caracteristica

    unless params["caracteristica"].nil?

      sql = "SELECT especies.nome, especies.id "
      sql += "FROM especie, alternativas_especies "
      sql += "WHERE especies.id = alternativa_especie.id and ("

      puts params["caracterisitca"].each { |value|
         puts value.to_s

      }
      puts "Hash inner value=>#{params['caracterisitca']['3']}"
      #sql += " alternativas_especies = " + value

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
