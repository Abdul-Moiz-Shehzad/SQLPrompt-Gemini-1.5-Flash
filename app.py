from dotenv import load_dotenv
load_dotenv()
import os
import google.generativeai as genai
import sqlite3
from sqlite3 import Cursor
import streamlit as st
from tabulate import tabulate

genai.configure(api_key=os.getenv("GOOGLE_API_KEY"))
model=genai.GenerativeModel('gemini-1.5-flash')
connection=sqlite3.Connection("DataBase.db")
cursor=connection.cursor()


def generate_response(prompt,question):
    response=model.generate_content([prompt,question])
    return response.text

st.title("SQLPrompt")
question=st.text_input("Enter your prompt")
button=st.button("Enter")

prompt='''Your task is a to provide SQL lite querys for the prompt i provide. The database name is DataBase.db
its detail is
tblCategory
CategoryID: int (NOT NULL, PRIMARY KEY)
CategoryName: nvarchar(255) (NULL)
tblContinent
ContinentID: int (NOT NULL, PRIMARY KEY)
ContinentName: nvarchar(255) (NULL)
Summary: varchar(100) (NULL)
tblCountry
CountryID: int (NOT NULL, PRIMARY KEY)
CountryName: nvarchar(255) (NULL)
ContinentID: int (NULL, FOREIGN KEY REFERENCES tblContinent(ContinentID))
tblEvent
EventID: int (NOT NULL, PRIMARY KEY)
EventName: varchar(8000) (NULL)
EventDate: date (NULL)
CountryID: int (NULL)
CategoryID: int (NULL, FOREIGN KEY REFERENCES tblCategory(CategoryID))

you have to just provide the sql query no explanation and stuff.

'''


if button and question:
    query = generate_response(prompt, question)
    if query.find('sql') != -1:
        query = query.replace('sql', '') # it was sometimes generating query with sql in the start
    if query.find('`') != -1:
        query = query.replace('`', '') # it was sometimes generating query with ``` 

    print(query)
    cursor.execute(query)
    results = cursor.fetchall()
    try:
        column_names = [description[0] for description in cursor.description]
        st.subheader("Result:")
        st.text(tabulate(results, headers=column_names, tablefmt="psql"))
    except:
        st.subheader("Result:")
        st.text("Nothing to show")
    cursor.close()
