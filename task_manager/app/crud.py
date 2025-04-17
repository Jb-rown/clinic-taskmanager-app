from .database import get_db_connection
from .models import Task, User, Category, Comment

# TASKS
def create_task(task: Task):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO tasks (title, description, completed, user_id, category_id) VALUES (%s, %s, %s, %s, %s)",
        (task.title, task.description, task.completed, task.user_id, task.category_id)
    )
    conn.commit()
    task_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return {"id": task_id, **task.dict()}

def get_all_tasks():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM tasks")
    tasks = cursor.fetchall()
    cursor.close()
    conn.close()
    return tasks

def update_task(task_id: int, task: Task):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE tasks SET title=%s, description=%s, completed=%s, user_id=%s, category_id=%s WHERE id=%s",
        (task.title, task.description, task.completed, task.user_id, task.category_id, task_id)
    )
    conn.commit()
    cursor.close()
    conn.close()
    return {"id": task_id, **task.dict()}

def delete_task(task_id: int):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM tasks WHERE id = %s", (task_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return {"message": f"Task {task_id} deleted"}

# USERS
def create_user(user: User):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, email) VALUES (%s, %s)", (user.username, user.email))
    conn.commit()
    user_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return {"id": user_id, **user.dict()}

# CATEGORIES
def create_category(category: Category):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO categories (name) VALUES (%s)", (category.name,))
    conn.commit()
    category_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return {"id": category_id, **category.dict()}

# COMMENTS
def create_comment(comment: Comment):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO comments (task_id, user_id, content) VALUES (%s, %s, %s)", 
                   (comment.task_id, comment.user_id, comment.content))
    conn.commit()
    comment_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return {"id": comment_id, **comment.dict()}

def get_comments_by_task(task_id: int):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM comments WHERE task_id = %s", (task_id,))
    comments = cursor.fetchall()
    cursor.close()
    conn.close()
    return comments
