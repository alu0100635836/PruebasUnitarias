# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase
        def setup
                @a = Fraccion.new(13,3)
                @b = Fraccion.new(46,5)
        end

        def test_suma
                assert_equal(Fraccion.new(203,15), @a.suma(@b))
        end

        def test_resta
                assert_equal(Fraccion.new(-73,15), @a.resta(@b))
        end

        def test_producto
                assert_equal(Fraccion.new(598,15), @a.producto(@b))
        end

        def test_division
                assert_equal(Fraccion.new(65,138), @a.division(@b))
        end

        def test_typecheck
                assert_raise ( RuntimeError ) { Fraccion.new('a','a') }
                assert_raise ( RuntimeError ) { Fraccion.new(13.2,3.5)}
        end

end
