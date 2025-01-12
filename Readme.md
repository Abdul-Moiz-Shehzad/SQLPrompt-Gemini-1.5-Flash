# SQLPrompt

SQLPrompt is a text-to-SQL application that allows users to interact with a SQLite database using natural language prompts. The application uses Google Generative AI to generate SQL queries based on user input and displays the results using Streamlit.

## Features

- Generate SQL queries from natural language prompts
- Execute SQL queries on a SQLite database
- Display query results in a tabular format

## Screenshot
![SQLPrompt Screenshot](https://github.com/Abdul-Moiz-Shehzad/SQLPrompt-Gemini-1.5-Flash/blob/main/Screenshot.png)

## Requirements

- Python 3.9+
- Streamlit
- SQLite3
- Google Generative AI

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Abdul-Moiz-Shehzad/SQLPrompt-Gemini-1.5-Flash
2. Install the required packages:
   ```bash
   pip install -r requirements.txt
3. Set up your environment variables: Create a .env file in the root directory and add your Google API key:
   ```bash
   GOOGLE_API_KEY=your_google_api_key

## Usage
1. Run the Streamlit app:
   ```bash
   streamlit run app.py
2. Enter your natural language prompt in the text input field and click "Enter".

## Note
You will need to modify the metadata in the prompt variable depending on the structure of your database.
