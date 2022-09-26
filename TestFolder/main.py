from fastapi import FastAPI
from models import Employee
from mongoengine import connect


app = FastAPI()
connect(db="admin" , host="localhost", port=27017)

@app.get("/")
def home():
    return {"message" : "Hello World!"}

@app.get("/get_all_employees")
def get_all_employees():
    employees = Employee.objects().to_json()
    
    print(employees)