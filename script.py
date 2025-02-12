import time
import random
import pyautogui
pyautogui.FAILSAFE = False
import pyodbc


conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                      'SERVER=localhost;'
                      'DATABASE=seu_banco_de_dados;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()


def clickf2():
    pyautogui.press('f2')


contador = 0


tempo_inicial = time.time()

print("Sistema Inicializado...")

while True:
    clickf2()
    contador += 1
    print(f"F2 Apertado: {contador} vezes")
    intervalo = random.randint(60, 120)
    print(f"Aguardando {intervalo} segundos...")
    tempo_decorrido = time.time() - tempo_inicial
    print(tempo_decorrido)
    time.sleep(intervalo)







