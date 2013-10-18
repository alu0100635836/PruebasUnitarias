# Implementar en este fichero la clase para crear objetos racionales

require_relative "gcd.rb"

class Fraccion
        attr_reader :n, :d
        
        def initialize(n,d)
      raise RuntimeError unless n.is_a? Integer and d.is_a? Integer
                @n, @d = n, d
        end

   def to_s
      "#{@n}/#{@d}"
   end

   def reducir(f)
      mcd = gcd(f.n, f.d)
      Fraccion.new(f.n/mcd, f.d/mcd)
   end

   def suma(other)
      mcm = (@d * other.d)/gcd(@d, other.d)
      f1 = Fraccion.new((mcm/@d) * @n, mcm)
      f2 = Fraccion.new((mcm/other.d) * other.n, mcm)
      reducir(Fraccion.new(f1.n + f2.n, mcm))
   end

   def resta(other)
      mcm = (@d * other.d)/gcd(@d, other.d)
      f1 = Fraccion.new((mcm/@d) * @n, mcm)
      f2 = Fraccion.new((mcm/other.d) * other.n, mcm)
      reducir(Fraccion.new(f1.n - f2.n, mcm))
   end

   def producto(other)
      reducir(Fraccion.new(@n * other.n, @d * other.d))
   end

   def division(other)
      reducir(Fraccion.new(@n * other.d, @d * other.n))
   end

   def ==(other)
           return @n == other.n && @d  == other.d if other.instance_of? Fraccion
           false
   end
end

system("clear")
a = Fraccion.new(13,3)
puts "Fraccion 1: " + a.to_s
b = Fraccion.new(46,5)
puts "Fraccion 2: " + b.to_s
puts
c = a.suma(b)
puts "Suma: " + c.to_s
d = a.resta(b)
puts "Resta: " + d.to_s
e = a.producto(b)
puts "Producto: " + e.to_s
f = a.division(b)
puts "Division: " + f.to_s
