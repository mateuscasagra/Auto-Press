import time
import random
import pyautogui
import pyodbc
from flask import Flask, request, jsonify
from flask_cors import CORS  # Importe o CORS

app = Flask(__name__)
CORS(app)  # Habilite o CORS para todas as rotas

pyautogui.FAILSAFE = False

# Banco de dados
conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=HUGIE;'  # ou o IP do servidor se necessário
    'DATABASE=Auto_Press;'
    'Trusted_Connection=yes;'  # Usando autenticação do Windows
)

cursor = conn.cursor()

@app.route('/', methods=['GET', 'POST'])
def action():
    if request.method == 'POST':
        data = request.get_json()
        state = data.get('state')
        print(state)

        if state == 'Inicia':
            
            cursor.execute("exec AddTime")
            conn.commit()
            return jsonify({'status': 'Inicia triggered'})

    # Resposta para qualquer tipo de requisição (GET ou POST)
    return jsonify({'status': 'Listening and responding'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

