# Fes un mètode iteratiu al que li passarem una llista d’enters 
# i ens retornarà la suma de tots els seus elements.

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
