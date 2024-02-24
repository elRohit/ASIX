def caracters_reversius_recursius(characters):
    if len(characters) == 0:
        raise ValueError("No hi ha cap caràcter")
    else:
        return caracters_reversius_recursius(characters[1:]) + characters[0]
    
def main():
    llista_caracters = input("Introdueix una paraula: ")
    try:
        print(f"El caràcter invers de la llista és {caracters_reversius_recursius(llista_caracters)}")
    except ValueError as error:
        print(error)

if __name__ == "__main__":
    main()