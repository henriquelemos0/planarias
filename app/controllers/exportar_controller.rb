# -*- encoding : utf-8 -*-
class ExportarController < ApplicationController

  layout 'empty'
  
  def alternativas_especies

    @especies = Especie.find(:all, :include => [:generos], :order => 'IFNULL (generos.nome,"ZZZ"), IFNULL(especies.nome,"ZZZ")')
    @caracteristicas = Caracteristica.all
    @alternativas = Alternativa.find(:all, :order => 'nome')

    headers['Content-Type'] = "application/vnd.ms-excel; charset=UTF-8"
    headers['Content-Disposition'] = 'attachment; filename="ChaveIdentificacao-MatrizGeral.xls"'
    headers['Cache-Control'] = ''
    
  end

end