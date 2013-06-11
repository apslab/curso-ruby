require 'minitest/autorun'
require './processor'

class TestProcessor < MiniTest::Unit::TestCase

  def test_leer_archivo
    caja = Caja.new('./test_data.csv')
    assert_equal 3, caja.contador_de_contribuyentes
  end

  def test_find_contribuyente
    caja = Caja.new('./test_data.csv')
    contribuyente = caja.buscar_por_nombre('juan')
    assert_equal 'juan', contribuyente.nombre 
  end

  def test_find_contribuyente_inexistente
    caja = Caja.new('./test_data.csv')
    contribuyente = caja.buscar_por_nombre('pedro')
    assert_equal nil, contribuyente 
  end
end
