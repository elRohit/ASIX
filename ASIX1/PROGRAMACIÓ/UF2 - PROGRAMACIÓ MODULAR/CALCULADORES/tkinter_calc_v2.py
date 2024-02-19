# https://docs.python.org/es/3.10/library/tkinter.ttk.html
from tkinter import *
from tkinter import messagebox
from functools import partial

def calcular(operacio):
    try:
        n1 = float(entN1.get())
        n2 = float(entN2.get())
        if operacio == "+":
            res = n1 + n2
        elif operacio == "-":
            res = n1 - n2
        elif operacio == "*":
            res = n1 * n2
        elif operacio == "/":
            if n2 == 0:
                raise ZeroDivisionError
            res = n1 / n2
        else:
            raise ValueError
        entResultat.config(state="normal")  
        entResultat.delete(0, END)
        entResultat.insert(0, str(res))
        entResultat.config(state="readonly") 
    except ValueError:
        messagebox.showwarning("Error", "N1 i N2 han de ser números")
    except ZeroDivisionError:
        messagebox.showwarning("Error", "No es pot dividir per 0")
    except:
        messagebox.showwarning("Error", "Error inesperat")

def sortir():
    finestra.quit()                     

finestra = Tk()
lbN1 = Label(finestra, text='N1')
lbN1.grid(row=0, column=0)
entN1 = Entry(finestra)
entN1.grid(row=0, column=1, columnspan=4)

lbN2 = Label(finestra, text='N2')
lbN2.grid(row=1, column=0)
entN2 = Entry(finestra)
entN2.grid(row=1, column=1, columnspan=4)

lbResultat = Label(finestra, text='Resultat')
lbResultat.grid(row=2, column=0)
entResultat = Entry(finestra, background="light grey", state="readonly")
entResultat.grid(row=2, column=1, columnspan=4)

boto1 = Button(finestra, text="Sortir", command=sortir)
boto1.grid(row=4, column=0)
boto1 = Button(finestra, text="+", command=partial(calcular, "+"), )
boto1.grid(row=4, column=1)
boto2 = Button(finestra, text="-", command=partial(calcular, "-"))
boto2.grid(row=4, column=2)
boto3 = Button(finestra, text="", command=partial(calcular, ""))
boto3.grid(row=4, column=3)
boto4 = Button(finestra, text="/", command=partial(calcular, "/"))
boto4.grid(row=4, column=4)

finestra.geometry("+{0}+{1}".format(400, 400))

mainloop()