# Fes un mètode recursiu que retorni el nombre de dígits de n

# Función que devuelve el número de dígitos de un número entero
def digits(n):
    if n == 0:
        return 0
    else:
        return 1 + digits(n // 10)

# Función que imprime el número de dígitos de un número entero    
def main():
    n = int(input("Introdueix un numero: "))
    print(digits(n))  
 
main()
 