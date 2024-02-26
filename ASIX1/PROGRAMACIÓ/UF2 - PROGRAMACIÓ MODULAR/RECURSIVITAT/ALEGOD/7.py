# Fes un mètode iteratiu que li doni la volta a una cadena de caràcters. 
# NOTA: Òbviament, si la cadena de caràcters és un palíndrom (ex: ada), 
# la sortida de la funció serà la mateixa cadena inicial.

# Función que invierte una cadena de caracteres
def vuelta_a_la(tortilla):
    return tortilla[::-1]

# Función que imprime la cadena de caracteres invertida
def main():
    tortilla = input("Entrodueix una cadena de caràcters: ")
    print(vuelta_a_la(tortilla))

main()        