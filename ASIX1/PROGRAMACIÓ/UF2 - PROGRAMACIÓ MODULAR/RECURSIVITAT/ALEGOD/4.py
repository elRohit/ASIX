#Fes que el mètode anterior  sigui recursiu, de tal manera que 
# calculi la suma del primer element de la llista mes la suma dels elements restants. 
# O sigui: suma([a,b,c,d]) = a+suma([b,c,d]) 

# Función que calcula la suma de los elementos de una lista de enteros
def sumaEnters(llista):
    contador = 0
    for i in llista:
        contador += i
    return contador
# Función que imprime la suma de los elementos de una lista de enteros
def main():
    llistaEnters = input("Introdueix numeros separats per un espai (ex. 1 2 3 4 5 10 ...) ").split()
    llistaEnters = [int(num) for num in llistaEnters]
    print(f"La suma dels elements de la llista és {sumaEnters(llistaEnters)}")

main()