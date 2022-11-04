from flask import Blueprint, jsonify, abort, request
from ..models import Account, Player, db
import hashlib
import secrets

def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()

bp = Blueprint('accounts', __name__, url_prefix='/accounts')

@bp.route('', methods=['GET'])

def index():
    accounts = Account.query.all() # ORM performs SELECT query
    result = []
    for a in accounts:
        result.append(a.serialize()) 
    return jsonify(result) # return JSON response

""" def index():
    result = []
    engine = db.get_engine()
    with engine.connect() as conn:
        rows = conn.execute('SELECT id, username, email FROM accounts;')
        for r in rows:
            result.append({'id': r[0], 'username': r[1], 'email': r[2]})
    return jsonify(result) """


""" @bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    result = []
    engine = db.get_engine()
    with engine.connect() as conn:
        rows = conn.execute('SELECT accounts.id AS accounts_id, accounts.name AS accounts_name, accounts.size AS accounts_size, accounts.player_id AS accounts_player_id FROM accounts WHERE accounts.id = %(pk_1)s')
        for r in rows:
            result.append({'id': r[0], 'username': r[1], 'email': r[2]})
    return jsonify(result)
 """

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    a = Account.query.get_or_404(id)
    return jsonify(a.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'username' not in request.json or 'password' not in request.json or 'email' not in request.json:
        return abort(400)
    a = Account(
        username=request.json['username'],
        password=scramble(request.json['password']),
        email=request.json['email']
    )
        
    db.session.add(a) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(a.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    a = Account.query.get_or_404(id)
    try:
        db.session.delete(a) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    a = Account.query.get_or_404(id)
    if 'username' not in request.json and 'password' not in request.json and 'email' not in request.json:
        return abort(400)
    if 'username' in request.json:
        if len(request.json['username']) < 3:
            return abort(400)
        a.username = request.json['username']
    if 'password' in request.json:
        if len(request.json['password']) < 8:
            return abort(400)
        a.password = scramble(request.json['password'])
    if 'email' in request.json:
        #validate email here
        a.email = request.json['email']

    try:
        db.session.commit()
        return jsonify(a.serialize())
    except:
        return jsonify(False)
