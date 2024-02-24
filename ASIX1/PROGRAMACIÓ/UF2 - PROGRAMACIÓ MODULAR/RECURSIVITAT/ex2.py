# 2.	Fes un mètode recursiu que calculi el factorial d’un número n. Pista: intenteu separar la formula en dues parts.

def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)
    
def main():
    n = int(input("Introdueix un nombre enter: "))
    print("El factorial de", n, "és", factorial(n))

if __name__ == "__main__":
    main()