class Interview < ApplicationRecord
  belongs_to :user
  #     VALIDACIONES PARA LA ENCUESTA
  validates :title, presence: true, length: { minimum:10 } 
  #Se tiene que validar el titulo para que no marque error en la prueba
  validates :description, presence: true, length: { minimum:20 }#Igual validar
  validates :expires_at, presence: true

    #    Se agrega el metodo
  def is_valid?
    DateTime.now < self.expires_at
  end
end
