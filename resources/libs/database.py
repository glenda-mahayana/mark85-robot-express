from robot.api.deco import keyword
from pymongo import MongoClient

client = MongoClient('mongodb+srv://qa:xperience@cluster0.v2sy4cv.mongodb.net/?appName=Cluster0')

db = client['markdb']

@keyword('Remove user from database')
def remove_user(email):
   users = db['users']
   users.delete_many({'email': email})
   print(f'removing user by email:' + email)

@keyword('Insert user from database')
def insert_user(user):
   #doc = {
   #   'name': name,
    #  'email': email,
     # 'password': password
   #}

   users = db['users']
   users.insert_one(user)
   print(user)