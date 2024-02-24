#4.	Fes que el mètode anterior  sigui recursiu, de tal manera que calculi la suma del primer element de la llista mes la suma dels elements restants. 
#O sigui: suma([a,b,c,d]) = a+suma([b,c,d]) 

def suma(llista):
    if len(llista) == 0:
        return 0
    else:
        return llista[0] + suma(llista[1:])
    
def main():
    llista_enters = [1, 2, 3, 4, 5]
    print(f"La suma dels elements de la llista és {suma(llista_enters)}")