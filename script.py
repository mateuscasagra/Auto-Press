import time
import random
import pyautogui
import pyodbc
import keyboard  # Biblioteca para detectar a pressão de teclas

pyautogui.FAILSAFE = False

# Conexão com o banco de dados
conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                      'SERVER=localhost\MSSQLSERVER01;'
                      'DATABASE=Auto_Press;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()

def clickf2():
    pyautogui.press('f2')

contador = 0
controle = True

print("Sistema Inicializado...")
cursor.execute("EXEC time_record")

while controle:
    clickf2()  
    contador += 1
    print(f"F2 Apertado: {contador} vezes")
    
    
    intervalo = random.randint(60, 120)
    print(f"Aguardando {intervalo} segundos...")
    time.sleep(intervalo)
    
 
    if keyboard.is_pressed('esc'):
        print("Tecla ESC pressionada. Finalizando...")
        controle = False

conn.close()  




