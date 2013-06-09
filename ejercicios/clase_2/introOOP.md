# Lenguajes estructurados VS lenguajes orientados a objecto

Los programas son diseñados con el concepto de objetos, donde cada objecto contiene sus propias variables para guardar sus datos acerca o relevante para el objecto, y funciones para ejecutar acciones, ejecutar calculos, agregar datos a variables dentro del objeto, etc.  Esto contrastado con Lenguaje de Programación Estructurados, en donde los programas
son diseñados con colecciones de funciones que son llamadas en diferentes partes del programa, mas parecido a un script o lista de tareas.


# Objectos

Un objeto es una combinación de datos y métodos. Los objectos se comunican entre si a través de métodos. Cada objecto puede recibir mensajes, enviar mensajes y procesar datos.

Hay dos pasos en la creación de objectos. Primero, definir una clase.  Una clase es un template de un objecto.  Es un modelo que describe el estado y comportamiento que todos los objectos de la clase comparten.  Una clase puede ser utilizada para crear muchos objectos.  Los objectos creados de una clase son llamados instancias.


# El constructor (initialize)

Constructors cannot be inherited. The constructor of a parent object is called with a super method. They are called in the order of inheritance.

(allocate)

Ruby has no constructor overloading that we know from other programming languages. This behaviour can be simulated to some extent with default parameter values in Ruby.

## Attributes

The object attributes are called instance variables or member fields. An instance variable is a variable defined in a class, for which each object in the class has a separate copy.

# Métodos

Methods are functions defined inside the body of a class. They are used to perform operations with the attributes of our objects. Methods are essential in encapsulation concept of the OOP paradigm. 

## Variable de instancia

	@var

## Variable de clase
	
	@@var

		#!/usr/bin/ruby

		class Circle

		@@PI = 3.141592

		def initialize
		    @radius = 0
		end

		def set_radius radius
		    @radius = radius
		end

		def area
		    @radius * @radius * @@PI
		end

		end

## Modificadores de acceso

Ruby has three access modifiers: public, protected and private

## Herencia

The inheritance is a way to form new classes using classes that have already been defined. The newly formed classes are called derived classes, the classes that we derive from are called base classes. Important benefits of inheritance are code reuse and reduction of complexity of a program. The derived classes (descendants) override or extend the functionality of base classes (ancestors).

p Human.ancestors

## Attribute accessors

attr_reader, attr_writer and attr_accessor.

## Sobrecarga de operadores

	class Circle
   
	attr_accessor :radius

	def initialize r
	    @radius = r
	end

	def +(other)
	    Circle.new @radius + other.radius
	end

	def to_s
	    "Circle with radius: #{@radius}"
	end
	end


	c1 = Circle.new 5
	c2 = Circle.new 6
	c3 = c1 + c2

	p c3

## Métodos de clase

3 modos: 

self.info

class << self

Class.info

## Método de instancia


## Polimorfismo

El polimorfismo es el proceso de usar un operador o función de diferentes modos para diferentes datos.

	class Animal
	    
	    def make_noise 
	        "Some noise"
	    end

	    def sleep 
	        puts "#{self.class.name} is sleeping." 
	    end
	  
	end

	class Dog < Animal
	    
	    def make_noise 
	        'Woof!'         
	    end 
	    
	end

## Modules

Los módulos en ruby son una coleccion de métodos, clases y constantes.  No pueden instanciarse, no soportan herencia.

Tienen 2 propósitos: 
+ Organizar el código
+ Mixin -> similar a herencia múltiple

	#!/usr/bin/ruby

	module Device
	    def switch_on ; puts "on" end    
	    def switch_off ; puts "off" end
	end

	module Volume
	    def volume_up ; puts "volume up" end    
	    def volume_down ; puts "volume down" end
	end

	module Pluggable
	    def plug_in ; puts "plug in" end    
	    def plug_out ; puts "plug out" end
	end

	class CellPhone
	    include Device, Volume, Pluggable
	   
	    def ring
	        puts "ringing"
	    end    
	end

	cph = CellPhone.new
	cph.switch_on
	cph.volume_up
	cph.ring

Include -> metodos en instancia
Extend -> metodos de clase

## Excepciones

special conditions that change the normal flow of program execution. Exceptions are raised, thrown or initiated.

	x = 35
	y = 0

	begin
	    z = x / y
	    puts z
	rescue => e
	    puts e
	    p e
	end

------

	age = 17

	begin
	    if age < 18
	        raise "Person is minor"
	    end
	    
	    puts "Entry allowed"
	rescue => e
	    puts e
	    p e
	    exit 1
	end

ensure

----------


	class BigValueError < StandardError ; end

	LIMIT = 333
	x = 3_432_453
	    
	begin
	    
	    if x > LIMIT
	        raise BigValueError, "Exceeded the maximum value"
	    end
	        
	    puts "Script continues"
	    
	rescue => e
	    puts e
	    p e
	    exit 1
	end


---- preguntas para responder luego
require vs include
rompe al querer cargar o usarla?


completar con datos de 
-- class 
-- herencia
-- 

Como impedir herencia desde una clase?
hooks - buscar como se realiza?

