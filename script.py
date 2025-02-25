import time
import random
import pyautogui

pyautogui.FAILSAFE = False


def clickf2():
    pyautogui.press('f2')

contador = 0

print("Sistema Inicializado...")


while True:
    clickf2()  
    contador += 1
    print(f"F2 Apertado: {contador} vezes")
    intervalo = random.randint(60, 120)
    print(f"Aguardando {intervalo} segundos...")
    time.sleep(intervalo)
    








