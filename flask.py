from flask import Flask, request, jsonify
import mysql.connector, logging, sys
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
logging.basicConfig(level=logging.DEBUG)

# Set up MySQL connection
db = mysql.connector.connect(
    host="10.0.3.27",
    user="admin",
    password="Admin@1234",
    database="example"
)
cursor = db.cursor()

# Create table if not exists
cursor.execute('''
    CREATE TABLE IF NOT EXISTS entries 
    (id INT AUTO_INCREMENT PRIMARY KEY, text_value VARCHAR(255))
''')

@app.route("/")
def home():
    app.logger.info("Processing default request")
    return "Hello, World!"

@app.route("/submit", methods=["GET", "POST"])
def submit():
    app.logger.info("Processing Submit request")
    data = request.get_json()
    text_value = data.get("textValue")
    cursor.execute("INSERT INTO entries (text_value) VALUES (%s)", (text_value,))
    db.commit()

    return jsonify({"message": "Data submitted successfully"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
