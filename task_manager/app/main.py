from fastapi import FastAPI
from . import crud
from .models import Task, User, Category, Comment

app = FastAPI()

# TASKS
@app.post("/tasks/")
def create_task(task: Task):
    return crud.create_task(task)

@app.get("/tasks/")
def read_tasks():
    return crud.get_all_tasks()

@app.put("/tasks/{task_id}")
def update_task(task_id: int, task: Task):
    return crud.update_task(task_id, task)

@app.delete("/tasks/{task_id}")
def delete_task(task_id: int):
    return crud.delete_task(task_id)

# USERS
@app.post("/users/")
def create_user(user: User):
    return crud.create_user(user)

# CATEGORIES
@app.post("/categories/")
def create_category(category: Category):
    return crud.create_category(category)

# COMMENTS
@app.post("/comments/")
def add_comment(comment: Comment):
    return crud.create_comment(comment)

@app.get("/tasks/{task_id}/comments")
def read_comments(task_id: int):
    return crud.get_comments_by_task(task_id)
