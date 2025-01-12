import sqlite3
sql_file_path = "setup_database.sql"

connection = sqlite3.connect("DataBase.db")
cursor = connection.cursor()

with open(sql_file_path, "r") as file:
    sql_script = file.read()

try:
   
    cursor.executescript(sql_script)
    print("Database setup completed successfully.")
except sqlite3.Error as e:
    print(f"An error occurred: {e}")
finally:
    connection.commit()
    connection.close()
