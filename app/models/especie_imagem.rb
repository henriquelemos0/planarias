# -*- encoding : utf-8 -*-
class EspecieImagem < ActiveRecord::Base

  belongs_to :especie

  validates :nome, :presence => true, :uniqueness => true
  validates :nome, :presence => true, :uniqueness => true
  validates :content_type, :presence => true
  validates :data, :presence => true

  validates_format_of :content_type,
                      :with => /^image/,
                      :message => "--- you can only upload pictures"

  def imagem_enviada=(picture_field)
    self.nome         = base_part_of(picture_field.original_filename)
    self.content_type = picture_field.content_type.chomp
    self.data         = picture_field.read
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end

end
