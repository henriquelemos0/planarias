class Alternativa < ActiveRecord::Base

  belongs_to :caracteristica
  has_and_belongs_to_many :especie

  #validates_format_of :content_type,
  #                    :with => %r{/^image|/}i,
  #                    :message => "--- you can only upload pictures"

  def imagem_enviada=(picture_field)
    self.nome_imagem  = base_part_of(picture_field.original_filename)
    self.content_type = picture_field.content_type.chomp
    self.imagem         = picture_field.read
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end

end
