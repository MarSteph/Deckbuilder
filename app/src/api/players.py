from flask import Blueprint, jsonify, abort, request
from ..models import Account, Player, db

bp = Blueprint('players', __name__, url_prefix='/players')

@bp.route('', methods=['GET'])

def index():
    players = Player.query.all() # ORM performs SELECT query
    result = []
    for p in players:
        result.append(p.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    p = Player.query.get_or_404(id)
    return jsonify(p.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'name' not in request.json or 'account_id' not in request.json:
        return abort(400)
    p = Player(
        name=request.json['name'],
        account_id=request.json['account_id']
    )
        
    db.session.add(p) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(p.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    p = Player.query.get_or_404(id)
    try:
        db.session.delete(p) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    p = Player.query.get_or_404(id)
    if 'name' not in request.json and 'account_id' not in request.json:
        return abort(400)
    if 'name' in request.json:
        p.name = request.json['name']
    if 'account_id' in request.json:
        p.account_id = request.json['account_id']

    try:
        db.session.commit()
        return jsonify(p.serialize())
    except:
        return jsonify(False)
