import tkinter as tk
from tkinter import ttk
import functools
import tkinter.messagebox

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
    try:
        result = eval(expression)
        entry.delete(0, tk.END)
        entry.insert(tk.END, result)
    except ZeroDivisionError:
        entry.delete(0, tk.END)
        entry.insert(tk.END, "ERROR: División por cero")
        tkinter.messagebox.showerror("ERROR", "División por cero")
    except:
        entry.delete(0, tk.END)
        entry.insert(tk.END, "ERROR")
        tkinter.messagebox.showerror("ERROR", "Escribe Algo Macho")

def main():
    global finestra
    finestra = tk.Tk()
    finestra.title("Calculadora Básica")

    style = ttk.Style()
    style.configure("TButton",
                    font=("Arial", 12),
                    padding=10,
                    background="white",  # Agrega un color de fondo oscuro
                    foreground="black")  # Agrega un color de texto claro
    style.configure("TEntry",
                    font=("Arial", 12),
                    padding=10,
                    background="white",  # Agrega un color de fondo oscuro
                    foreground="black")  # Agrega un color de texto claro

    global entry
    entry = ttk.Entry(finestra, width=35)
    entry.grid(row=0, column=0, columnspan=3, padx=10, pady=10)

    equal_button = ttk.Button(finestra, text="=", command=calcular)
    equal_button.grid(row=0, column=3)

    operacions = ["+", "-", "*", "/"]

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
        button = ttk.Button(finestra, text=txt_boto, command=lambda text=txt_boto: afegirDigit(text))
        button.grid(row=row, column=column)

    return_lletra = ttk.Button(finestra, text="<-", command=popDisplay)
    return_lletra.grid(row=4, column=2)  

    boto_clear = ttk.Button(finestra, text="C", command=clearDisplay)
    boto_clear.grid(row=4, column=1)  

    finestra.mainloop()

if __name__ == "__main__":
    main()