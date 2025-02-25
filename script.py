import time
import random
import pyautogui
import pyodbc
from flask import Flask, request, jsonify
app = Flask(__name__)
pyautogui.FAILSAFE = False

conn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                        'SERVER=localhost\MSSQLSERVER01;'
                        'DATABASE=Auto_Press;'
                        'Trusted_Connection=yes;')

cursor = conn.cursor()


iniciaPrograma = False  # Global variable to track "Inicia"
EncerraPrograma = False 

@app.route('/', methods=['GET', 'POST'])
def action():
    global iniciaPrograma, EncerraPrograma

    if request.method == 'POST':
        data = request.get_json()
        state = data.get('state')

        if state == 'Inicia':
            iniciaPrograma = True
            cursor.execute("""exec AddTime Dia, TempoEntrada""")
            return jsonify({'status': 'Inicia triggered'})
        
        elif state == 'Encerra':
            EncerraPrograma = False
            cursor.execute("""exec PROCEDURE Registra_hora_Saida""")
            return jsonify({'status': 'Encerra triggered'})
        
        return jsonify({'status': 'Invalid state'})



def clickf2():
    pyautogui.press('f2')

contador = 0
controle = True
print("Sistema Inicializado...")



while iniciaPrograma:
    clickf2()  
    contador += 1
    print(f"F2 Apertado: {contador} vezes")
    intervalo = random.randint(60, 120)
    print(f"Aguardando {intervalo} segundos...")
    time.sleep(intervalo)
    
    

print("Loop Interrompido")





