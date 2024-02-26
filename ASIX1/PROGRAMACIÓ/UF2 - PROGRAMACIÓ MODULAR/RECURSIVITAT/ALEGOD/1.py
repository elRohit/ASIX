# Fes un mètode iteratiu que calculi el factorial d’un número n.
# Exemple: El valor de 5! = 5 x 4 x 3 x 2 x 1.

# Función que calcula el factorial de un número entero

def factorial(n):
    resultat = 1
    i = n
    while i > 0:
        resultat *= i
        i -= 1
    return resultat

# Función que imprime el factorial de un número entero
def main():
    n = int(input("Introdueix un numero enter: "))
    print("El factorial de", n, "és", factorial(n))

main()    