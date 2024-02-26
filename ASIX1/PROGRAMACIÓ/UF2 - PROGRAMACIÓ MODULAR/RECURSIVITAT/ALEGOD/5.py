# Fes que el mètode anterior sigui recursiu, però que vagi 
# particionant la llista per la meitat, en dos subllistes, 
# i calculi la suma de les 2 subllistes. 
# O sigui: suma([a,b,c,d])=suma([a,b])+suma([c,d])

# Función que calcula la suma de los elementos de una lista de enteros
def suma(llista):
    if not llista:
        return 0
    elif len(llista) == 1:
        return llista[0]
    else:
        mid = len(llista) // 2
        return suma(llista[:mid]) + suma(llista[mid:])
    
# Función que imprime la suma de los elementos de una lista de enteros
def main():
    llista = input("Introdueix numeros separats per un espai (ex. 1 2 3 4 5 10 ...) ").split()
    llista = [int(num) for num in llista]
    resultat = suma(llista)
    print(f"La suma de los elementos de la lista es: {resultat}")

main()    