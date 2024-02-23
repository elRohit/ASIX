#!/usr/bin/env python
# -*- coding: utf-8 -*-

#IMPORTAR LLIBRERIES NECESÀRIES
from tkinter import *
from tkinter import messagebox
from math import *

#VISUALIZAR LA OPERACION EN LA PANTALLA
def btnClik(num):
    global operador
    operador=operador+str(num)
    input_text.set(operador)

#CÁLCULO Y MUESTRA DE RESULTADOS.
def resultado():
    global operador
    try:
        opera=str(eval(operador))
        input_text.set(opera)
    except ZeroDivisionError:
        input_text.set("ERROR: División por cero")
        messagebox.showerror("ERROR","División por cero")

    except:
        input_text.set("ERROR")
        messagebox.showerror("ERROR","Escribe Algo Macho")
    operador = ""

#LIMPIEZA DE PANTALLA.
def clear():
    global operador
    operador=("")
    input_text.set("0")

#FINESTRA PRINCIPAL
ventana=Tk()
ventana.title("Calculadora Estàndarv2")
ventana.geometry("392x600")
ventana.configure(background="pink")
color_boton=("pink")
#TAMANY DE BOTONS
ancho_boton=11
alto_boton=3
input_text= StringVar()
operador=""
##ESTILS DE BOTONS, ALGUNS AMB FUNCIONS LAMBDA
Salida=Entry(ventana,font=('arial',20,'bold'),width=22,
textvariable=input_text,bd=20,insertwidth=4,bg="red",justify="right")
Salida.place(x=10,y=60)

#AÑADIR BOTONES.EN BUCLE NO PORQUE CONTIENE CADENAS E INTEGERS
a = Button(ventana,text="0",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(0))
a.place(x=17,y=180)

b = Button(ventana,text="1",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(1))
b.place(x=107,y=180)

c = Button(ventana,text="2",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(2))
c.place(x=197,y=180)

d = Button(ventana,text="3",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(3))
d.place(x=287,y=180)

e = Button(ventana,text="4",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(4))
e.place(x=17,y=240)

f = Button(ventana,text="5",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(5))
f.place(x=107,y=240)

g = Button(ventana,text="6",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(6))
g.place(x=197,y=240)

h = Button(ventana,text="7",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(7))
h.place(x=287,y=240)

i = Button(ventana,text="8",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(8))
i.place(x=17,y=300)

j = Button(ventana,text="9",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(9))
j.place(x=107,y=300)

k = Button(ventana,text="π",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("pi"))
k.place(x=197,y=300)

l = Button(ventana,text=",",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("."))
l.place(x=287,y=300)

m = Button(ventana,text="+",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("+"))
m.place(x=17,y=360)

n = Button(ventana,text="-",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("-"))
n.place(x=107,y=360)

o = Button(ventana,text="*",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("*"))
o.place(x=197,y=360)

p = Button(ventana,text="/",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("/"))
p.place(x=287,y=360)

q = Button(ventana,text="√",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("sqrt("))
q.place(x=17,y=420)

r = Button(ventana,text="(",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("("))
r.place(x=17,y=480)

s = Button(ventana,text=")",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik(")"))
s.place(x=107,y=480)

t = Button(ventana,text="%",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("%"))
t.place(x=197,y=480)

u = Button(ventana,text="ln",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("log("))
u.place(x=287,y=480)

v = Button(ventana,text="C",bg=color_boton,width=ancho_boton,height=alto_boton,command=clear)
v.place(x=107,y=420)

w = Button(ventana,text="EXP",bg=color_boton,width=ancho_boton,height=alto_boton,command=lambda:btnClik("**"))
w.place(x=197,y=420)

x = Button(ventana,text="=",bg=color_boton,width=ancho_boton,height=alto_boton,command=resultado)
x.place(x=287,y=420)

clear()

ventana.mainloop()