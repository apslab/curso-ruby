require 'csv'

class Contribuyente
  attr_accessor :nombre, :apellido, :alicuota
  def initialize(nombre, apellido, alicuota)
    @nombre = nombre
    @apellido = apellido
    @alicuota = alicuota
  end

  def to_s 
    if @apellido && @nombre
      "#{@apellido}, #{@nombre} con alicuota: #{@alicuota}"
    else
      "vacio"
    end
  end
end

# TODO: Puedo no pasar la lista?
#
module Buscador

  attr_accessor :lista

  def buscar(a_buscar, valor, &block)
    block = Proc.new { |c| c.send(a_buscar) == valor } if block.nil?
    lista.find(&block)
  end
end

class OtraCaja
  include Buscador

  def initialize
    self.lista = [
      { :nombre => 'Juan', apellido: 'Perez' },
      { nombre: 'Alberto', apellido: 'Rodriguez' },
      { nombre: 'Damian', apellido: 'Lopez' }
    ]
  end
end

# La clase caja obtiene los contribuyentes de un archivo CSV
# Y permite buscar por apellido
class Caja 

  include Buscador

  def initialize(file_path)
    @contribuyentes = {}
    @count = 0
    CSV.foreach(file_path) do |row|
      @count += 1
      c = Contribuyente.new(row[0].strip, row[1].strip, row[2].strip)
      if @contribuyentes.key?(c.alicuota)
        @contribuyentes[c.alicuota] << c 
      else
        @contribuyentes[c.alicuota] = [c]
      end
    end
    self.lista = @contribuyentes.values.flatten
  end

  def contador_de_contribuyentes
    @count
  end
  
  def buscar(a_buscar, valor)
    self.lista.find { |c| c.send(a_buscar) == valor }
  end
end



