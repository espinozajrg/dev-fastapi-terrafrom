# importar fast api (clase)
from fastapi import FastAPI
import random
import string



## crear objeto que instacie la API
app = FastAPI()   





## secrea la ruta 
@app.get("/")
## se crea funcion
def index(): 
    return {"message" : "Este mesaje es desde la API"}

## decuelve el numero que pasas en el request
@app.get("/random/{id}")
def mostrar_id(id: int):
    return {"data" : id}

@app.get("/pwd/{length}")
def generate_random_password(length):
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(random.choice(characters) for _ in range(int(length)))
    return {"newPassword" : password}