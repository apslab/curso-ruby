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
      c = Contribuyente.new(row[0], row[1], row[2])
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

  def buscar_por_nombre(nombre)
    @contribuyentes.each do |key, values|
      el_buscado = values.find { |c| c.nombre == nombre }
      return el_buscado if el_buscado != nil
    end
    return nil
  end
end



