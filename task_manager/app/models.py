from pydantic import BaseModel
from datetime import datetime


# Define the models for the task manager application
# using Pydantic for data validation and serialization
class User(BaseModel):
    name: str
    email: str

class Task(BaseModel):
    user_id: int
    title: str
    description: str
    completed: bool
    category_id: int
    status: str
    priority: str
    due_date: str
    created_at: str
    updated_at: str
    completed_at: str = None
   
class Category(BaseModel):
    name: str

class Comment(BaseModel):
    task_id: int
    user_id: int
    content: str
