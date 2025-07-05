from flask import Flask

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from Flask!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True) 
