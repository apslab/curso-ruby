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

# La clase caja obtiene los contribuyentes de un archivo CSV
# Y permite buscar por apellido
class Caja 

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
  end

  def contador_de_contribuyentes
    @count
  end

  # a_buscar: el campo que estoy buscando (ejemplo: nombre, apellido)
  # valor: el valor a buscar sobre el campo
  def buscar(a_buscar, valor)
    @contribuyentes.each do |key, values|
      el_buscado = values.find { |c| c.send(a_buscar) == valor }
      return el_buscado if el_buscado != nil
    end
    return nil
  end

end



