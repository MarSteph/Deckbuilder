from src import create_app
from flask import Flask

app = create_app()
#app = Flask(__name__)


@app.route('/')
def title():
    return 'MTG Deckbuilder'


if __name__ == "__main__":
    #app.run(debug=True, host='0.0.0.0')
    app.run(host='0.0.0.0', port=5000)
