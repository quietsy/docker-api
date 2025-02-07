from flask import Flask
from flask import jsonify
from keyvaluestore import KeyValueStore

api = Flask(__name__)


@api.route('/')
def hello():
    with KeyValueStore() as kv:
        return jsonify(kv['images'])

if __name__ == '__main__':
    api.run()
