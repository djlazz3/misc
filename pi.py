from decimal import *
def factorial(n):
    temp = 1
    for i in range(n, 0, -1):
        temp = temp * i
    return temp
getcontext().prec = 100000
pi = Decimal(0)
k = 0
while k < 500:
    pi += (Decimal(-1)**k)*(Decimal(factorial(6*k))/((factorial(k)**3)*(factorial(3*k)))* (13591409+545140134*k)/(640320**(3*k)))
    k += 1
    print(k)
pi = pi * Decimal(10005).sqrt()/4270934400
pi = pi**(-1)
print(pi)
