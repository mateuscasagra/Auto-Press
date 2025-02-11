import time
import random
import pyautogui
pyautogui.FAILSAFE = False


def clickf2():
    pyautogui.press('f2')



contador = 0

class status:
    Interrompido = False
    Encerrado = False
    Iniciado = True


#Inicia o script caso aperte 2 script pausa caso aperte 1 retoma caso aperta 3 encerra
print("Sistema Inicializado...")

while status.Iniciado == True:
    clickf2()


opcao = input("(1)Retomaz\n(2)Interrompe\n(3)Encerra")
def switch(opcao):
    if opcao == 1 and status.Iniciado == True:
        return"Sistema Rodando..."
    
    elif opcao == 1 and status.Interrompido == True:
        status.Interrompido == False
        status.Iniciado == True

    elif opcao == 2 and status.Iniciado == True:
        status.Iniciado == False
        status.Interrompido == True
        print("Sistema Interrompido...")
        
    else: print("Opcao Invalida")
        



