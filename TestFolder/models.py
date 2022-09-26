from mongoengine import Document, StringField, IntField

class Employee(Document):
    name = StringField(max_length = 100)
    age = IntField()