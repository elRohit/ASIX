def calcular_llista(llista):
    contar = 0
    for i in llista:
        contar += i
    return contar

def main():
    llista_enters = [1, 2, 3, 4, 5]
    print(f"La suma dels elements de la llista és {calcular_llista(llista_enters)}")
    
if __name__ == "__main__":
    main()