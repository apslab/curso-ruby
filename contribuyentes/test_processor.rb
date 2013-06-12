require 'minitest/autorun'
require './processor'

class TestProcessor < MiniTest::Unit::TestCase

  def test_leer_archivo
    caja = Caja.new('./test_data.csv')
    assert_equal 3, caja.contador_de_contribuyentes
  end

  def test_find_contribuyente_por_nombre
    caja = Caja.new('./test_data.csv')
    contribuyente = caja.buscar('nombre', 'juan')
    assert_equal 'juan', contribuyente.nombre 
  end

  def test_find_contribuyente_inexistente
    caja = Caja.new('./test_data.csv')
    contribuyente = caja.buscar('nombre', 'pedro')
    assert_equal nil, contribuyente 
  end
  
  def test_find_contribuyente_por_apellido
    caja = Caja.new('./test_data.csv')
    contribuyente = caja.buscar('apellido', 'lopez')
    assert_equal 'lopez', contribuyente.apellido 
  end

end
