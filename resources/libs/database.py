from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://QA:TESTE@db.ame3i.mongodb.net/mongodb?retryWrites=true&w=majority&appName=DB')
db = client['mongodb']

@keyword('Remover usuario pelo email do banco de dados')
def remove_user(email):
    users = db['users']
    users.delete_many({'email': email})
    print('removing user by ' + email)