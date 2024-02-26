#Fes un mètode recursiu que calculi el factorial d’un número n. 
# Pista: intenteu separar la formula en dues parts.

# Función que calcula el factorial de un número entero
def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)
    
# Función que imprime el factorial de un número entero
def main():
    n = int(input("Introdueix un numero enter: "))
    print("El factorial de", n, "és", factorial(n))

main()    