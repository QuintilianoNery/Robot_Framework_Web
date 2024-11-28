from robot.api.deco import keyword
from pymongo import MongoClient
import bcrypt

client = MongoClient('mongodb+srv://QA:TESTE@db.ame3i.mongodb.net/mongodb?retryWrites=true&w=majority&appName=DB')
db = client['mongodb']

@keyword('Remover usuario pelo email do banco de dados')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user by ' + email)

# @keyword('Incluir usuario no banco de dados')
# def insert_user(name, email, password):
#     doc = {
#         'name': name,
#         'email': email,
#         'password': password
#     }
#     users = db['users']
#     users.insert_one(doc)
#     import json
#     # print('insert user' + json.dumps(doc))
#     print(f'insert user {doc}')

@keyword('Incluir usuario no banco de dados')
def insert_user(name, email, password):
    # Gerar o hash da senha
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    # Criar o documento do usuário
    doc = {
        'name': name,
        'email': email,
        'password': hashed_password.decode('utf-8')  # Salvar como string no MongoDB
    }
    
    # Inserir no banco de dados
    users = db['users']
    users.insert_one(doc)
    print(f'insert user {doc}')
