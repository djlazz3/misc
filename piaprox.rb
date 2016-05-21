require 'bigdecimal'
	def factorial(n)
	  (1..n).inject(:*) || 1
	end
pi = BigDecimal.new("0.0")
k = 0
while k < 18
	pi += ((-1.0**k)*factorial(6.0*k)/((factorial(k)**3.0)*factorial(k*3.0))* (13591409.0+545140134.0*k)/(640320.0**(3.0*k)))
	k+=1

end
pi = pi * Math.sqrt(10005.0)/4270934400.0
pi = pi**(-1.0)
puts pi.ceil(1000000)
