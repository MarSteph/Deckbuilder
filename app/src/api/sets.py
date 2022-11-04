from flask import Blueprint, jsonify, abort, request
from ..models import Deck, Card, Set, db

bp = Blueprint('sets', __name__, url_prefix='/sets')

@bp.route('', methods=['GET'])

def index():
    sets = Set.query.all() # ORM performs SELECT query
    result = []
    for s in sets:
        result.append(s.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    s = Set.query.get_or_404(id)
    return jsonify(s.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'name' not in request.json:
        return abort(400)
    s = Set(
        name=request.json['name']
    )
        
    db.session.add(s) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(s.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    s = Set.query.get_or_404(id)
    try:
        db.session.delete(s) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    s = Set.query.get_or_404(id)
    if 'name' not in request.json:
        return abort(400)
    else:
        s.name = request.json['name']

    try:
        db.session.commit()
        return jsonify(s.serialize())
    except:
        return jsonify(False)
