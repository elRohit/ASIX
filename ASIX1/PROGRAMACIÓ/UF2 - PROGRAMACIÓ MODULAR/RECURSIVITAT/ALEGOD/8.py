# Fes un mètode iteratiu que li doni la volta a una cadena de caràcters. 
# NOTA: Òbviament, si la cadena de caràcters és un palíndrom (ex: ada), 
# la sortida de la funció serà la mateixa cadena inicial.

def vuelta_a_la(tortilla):
    if len(tortilla) == 0:
        return tortilla
    else:
        return vuelta_a_la(tortilla[1:]) + tortilla[0]

def main():
    tortilla = input("Introdueix una cadena de càracters: ")
    print(vuelta_a_la(tortilla))    

main()    