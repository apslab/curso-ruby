# Closure

Es una función evaluada en un entorno conteniendo una o mas variables de otro entorno (llamadas variables libres) esta función puede acceder a ellas

# Bloques

	def metodo_con_bloque(&bloque)
		bloque.call
	end

	def metodo_con_bloque_sin_arg
		yield
	end

	def metodo_con_bloque_sin_arg_tuned
		yield if block_given?
	end


	def mostrar_el_resultado
		if block_given?
			value = yield
			puts "El bloque retorno: #{value}"
		end
	end

Ejemplo de uso:

class Document
   
  attr_accessor :content
   
  def initialize(content = nil)
    @content = ''
  	yield(self) if block_given?
  end
end

## Proc (funciones anónimas) y lambdas
Diferencias:

1. The first difference is that, unlike Procs, lambdas check the number of arguments passed.

Proc.new{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"}
lambda{|a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}"}

2. Las lambda tienen retornos diminutivos. El retorno de Proc detiene el método donde se encuentra y devuelve el valor provisto. 

def proc_return
  Proc.new { return "Proc.new"}.call
  return "proc_return method finished"
end

def lambda_return
  lambda { return "lambda" }.call
  return "lambda_return method finished"
end


# Metaprogramación

Coding techniques that allow you to get the results you need with less code.

## Hooks

### Herencia

class SimpleBaseClass
	def self.inherited( new_subclass )
		puts "Hey #{new_subclass} is now a subclass of #{self}!"
	end
end

Ejemplo: Importación de un documento.  Subclases (XML, JSON, YAML, etc). Cuando heredo, en la clase padre guardo un array con cada tipo

### Modulos

module WritingQuality
	def self.included(klass)
		puts "Hey, I've been included in #{klass}"	
	end
end

module UsefulMethods
	module ClassMethods
		def a_class_method
			puts "A class method!!"
		end
	end

	def self.included(host_class)
		host_class.extend(ClassMethods)
	end

	def an_instance_method
		puts "an instance method!"
	end
end

class Host
	include UsefulMethods
end

### at_exit

	at_exit:
		Ejemplo:
			at_exit do
				puts "Goodbye!"
			end

### method_missing

class Roman
	def convert(str)
		return 21 if str == 'xxi'
		return 20 if str == 'xx'
	end

	def method_missing(method)
		convert(method.to_s)
	end
end

class Echo
	def method_missing(method, *args)
		puts "-> You call: #{method}(#{args.join(', ')})"
	end

	def respond_to?(method)
		true
	end
end


### const_missing

def self.const_missing(const_name)

### method_added


# Mas de Metaprogramming y monkey patching

## alias_method	

alias_method :new_method, :original

class Document
	private :word_count
end

## Define method

send :define_method, method_name do
  puts arg
end

### instance_eval

method = "def test; puts 'test...'; end"
object.instance_eval(method)

### class_eval

%q sin interpolación
%Q (default) con interpolación
%w, %W Array of words separadas por espacios
%x shell commands

class Document
	
	code = %Q{ 
		def hello_world
			puts 'hello world!!'
		end
	}
	class_eval(code)
end

class Document
	self.privatize
		private :content
	end
end

### Domain specific languages


# Para subir a la pagina
## socket y conection 
eventmachine y celluloid
