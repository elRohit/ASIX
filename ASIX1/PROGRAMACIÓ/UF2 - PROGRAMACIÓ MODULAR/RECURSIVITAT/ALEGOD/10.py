# Explica què resol la següent funció i posa-li un nom convenient:

# La següent funció es fa servir per trobar el màxim comú divisor (MCD) de dos numeros. 
# El MCD de dos enters es el numero més gran que divideix a tots dos sense deixar residu.

def mcd(primerNumero, segonNumero):
    if segonNumero == 0:
        return primerNumero
    else:
        return mcd(segonNumero, primerNumero % segonNumero)
    
def main():
    primerNumero = int(input("Introdueix un número enter: "))
    segonNumero = int(input("Introdueix un altre número enter: "))
    print(f"El màxim comú divisor de {primerNumero} i {segonNumero} és {mcd(primerNumero, segonNumero)}") 

main()    
