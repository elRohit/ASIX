# 1.	Fes un mètode iteratiu que calculi el factorial d’un número n. 
def factorial(n):
    resultat = 1
    for i in range(n):
        resultat *= n-i
    return resultat

# Codi principal
def main():
    n = int(input("Introdueix un nombre enter: "))
    print("El factorial de", n, "és", factorial(n))

#Execució
if __name__ == "__main__":
    main()
