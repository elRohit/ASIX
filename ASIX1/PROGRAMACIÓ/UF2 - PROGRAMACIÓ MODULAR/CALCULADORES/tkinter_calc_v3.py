import tkinter as tk
import tkinter.messagebox
import functools # Permet passar paràmetres a la funció que es crida des del botó

def afegirDigit(d):
    existent = entry.get()
    entry.delete(0, tk.END)
    entry.insert(tk.END, existent + str(d))

def popDisplay():
    existent = entry.get()
    entry.delete(0, tk.END)
    entry.insert(tk.END, existent[:-1])

def clearDisplay():
    entry.delete(0, tk.END)

def calcular():
    expression = entry.get()
    result = eval(expression)
    entry.delete(0, tk.END)
    entry.insert(tk.END, result)

def main():


    finestra = tk.Tk()
    finestra.title("Calculadora Básica")

    #1.  Aquest és el display de la calculadora per veure els números que s'han introduït i el resultat (no editable)
    global entry
    entry = tk.Entry(finestra, width=35, borderwidth=5)
    entry.grid(row=0, column=0, columnspan=3, padx=10, pady=10)  # Updated columnspan to 4

    equal_button = tk.Button(finestra, text="=", padx=40, pady=20, command=calcular)
    equal_button.grid(row=0, column=3)

    operacions = ["+", "-", "*", "/"]

    #2.  Aquesta és la llista de botons que es mostren a la calculadora junts amb les seves coordenades de row i column del aparmetre GRID, 
    buttons = [
        ("1", 1, 0),
        ("2", 1, 1),
        ("3", 1, 2),
        ("4", 2, 0),
        ("5", 2, 1),
        ("6", 2, 2),
        ("7", 3, 0),
        ("8", 3, 1),
        ("9", 3, 2),
        ("0", 4, 0),
        (operacions[0], 1, 3),
        (operacions[1], 2, 3),
        (operacions[2], 3, 3),
        (operacions[3], 4, 3)
        ]

    for txt_boto, row, column in buttons:
        button = tk.Button(finestra, text=txt_boto, padx=40, pady=20, command=lambda text=txt_boto: afegirDigit(text))
        button.grid(row=row, column=column)

    return_lletra = tk.Button(finestra, text="<-", padx=40, pady=20, command=popDisplay)
    return_lletra.grid(row=4, column=2)  

    boto_clear = tk.Button(finestra, text="C", padx=40, pady=20, command=clearDisplay)
    boto_clear.grid(row=4, column=1)  


    finestra.mainloop()

if __name__ == "__main__":
    main()