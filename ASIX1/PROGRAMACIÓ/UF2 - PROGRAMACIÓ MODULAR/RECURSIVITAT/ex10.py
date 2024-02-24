def maxim_comu_divisor(x, y):
    if y == 0:
        return x
    else:
        return maxim_comu_divisor(y, x % y)
    
def main():
    num1 = int(input("Introdueix un número enter: "))
    num2 = int(input("Introdueix un altre número enter: "))
    print(f"El màxim comú divisor de {num1} i {num2} és {maxim_comu_divisor(num1, num2)}")

if __name__ == "__main__":
    main()