# -*- encoding : utf-8 -*-
class VerespecieImagemController < ApplicationController

  def imagem
    @especie_imagem = EspecieImagem.find(params[:id])
    send_data(@especie_imagem.data,
              :filename => @especie_imagem.nome,
              :type => @especie_imagem.content_type,
              :disposition => "inline")
  end

protected

  def authorize

  end

end
