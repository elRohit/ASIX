from tkinter import *
from tkinter import messagebox

#Funcions x Operacions

def Sumar():
    try:
        res = float(EntryNum1.get()) + float(EntryNum2.get())
        entResultat.delete(0,END)
        entResultat.insert(0,str(res))
    except ValueError:
        messagebox.showwarning("Error","N1 i N2 han de números")
    except ZeroDivisionError:
        messagebox.showwarning("Error","No es pot dividir per 0")

def Restar():
    try:
        res = float(EntryNum1.get()) - float(EntryNum2.get())
        entResultat.delete(0,END)
        entResultat.insert(0,str(res))
    except ValueError:
        messagebox.showwarning("Error","N1 i N2 han de números")
    except ZeroDivisionError:
        messagebox.showwarning("Error","No es pot dividir per 0")

def Multiplicar():
    try:
        res = float(EntryNum1.get()) * float(EntryNum2.get())
        entResultat.delete(0,END)
        entResultat.insert(0,str(res))
    except ValueError:
        messagebox.showwarning("Error","N1 i N2 han de números")
    except ZeroDivisionError:
        messagebox.showwarning("Error","No es pot dividir per 0")

def Dividir():
    try:
        res = float(EntryNum1.get()) / float(EntryNum2.get())
        entResultat.delete(0,END)
        entResultat.insert(0,str(res))
    except ValueError:
        messagebox.showwarning("Error","N1 i N2 han de números")
    except ZeroDivisionError:
        messagebox.showwarning("Error","No es pot dividir per 0")

def Sortir():
    finestra.destroy()

def main():
    global finestra
    finestra = Tk()
    labelNum1 = Label(finestra,text='Numero 1')
    labelNum1.grid(row=0,column=0)
    global EntryNum1
    EntryNum1 = Entry(finestra)
    EntryNum1.grid(row=0,column=1,columnspan=4)

    labelNum2 = Label(finestra,text='Numero 2')
    labelNum2.grid(row=1,column=0)
    global EntryNum2
    EntryNum2 = Entry(finestra)
    EntryNum2.grid(row=1,column=1,columnspan=4)

    labelResultat = Label(finestra,text='Resultat')
    labelResultat.grid(row=2,column=0)
    global entResultat
    entResultat = Entry(finestra)
    entResultat.grid(row=2,column=1,columnspan=4)
    
    #global exit_img
    #exit_img = ImageTk.PhotoImage(Image.open("C:/Users/rkuma/Documents/GitHub/ASIX1/Prog/Python/UF2_Programcio_Modular/Python visual/exit.png").resize((50,50)))
    #BtnQuit = Button(finestra, image=exit_img, command=Sortir)
    #BtnQuit.grid(row=3, column=0)

    BtnSuma = Button(finestra,text="Sumar",command=Sumar)
    BtnSuma.grid(row=3,column=1)

    BtnResta = Button(finestra,text="Restar",command=Restar)
    BtnResta.grid(row=3,column=2)

    BtnMult = Button(finestra,text="Multiplicar",command=Multiplicar)
    BtnMult.grid(row=3,column=3)

    BtnDiv = Button(finestra,text="Dividir",command=Dividir)
    BtnDiv.grid(row=3,column=4)

    finestra.geometry("+{0}+{1}".format(400,400))

    finestra.mainloop()

if __name__ == "__main__":
    main()
