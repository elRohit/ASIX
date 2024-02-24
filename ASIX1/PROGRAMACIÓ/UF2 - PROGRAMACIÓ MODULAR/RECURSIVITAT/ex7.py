def caracter_reversiu_itineratiu(characters):
    contador_caracter = ""
    # For i in range(start, stop, step)
    for i in range(len(characters)-1,-1,-1):
        contador_caracter += characters[i]
    return contador_caracter

def main():
    llista_caracters = input("Introdueix una paraula: ")
    print(f"El caràcter invers de la llista és {caracter_reversiu_itineratiu(llista_caracters)}")

if __name__ == "__main__":
    main()