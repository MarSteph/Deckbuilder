from flask import Blueprint, jsonify, abort, request
from ..models import Deck, Card, Set, db

bp = Blueprint('cards', __name__, url_prefix='/cards')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    cards = Card.query.all() # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    c = Card.query.get_or_404(id)
    return jsonify(c.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'name' not in request.json or 'rarity' not in request.json or 'type' not in request.json or 'color_identity' not in request.json or 'cmc' not in request.json or 'set_id' not in request.json:
        return abort(400)
    c = Card(
        name=request.json['name'],
        rarity=request.json['rarity'],
        type=request.json['type'],
        color_identity=request.json['color_identity'],
        cmc=request.json['cmc'],
        set_id=request.json['set_id']
    )
        
    db.session.add(c) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(c.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    c = Card.query.get_or_404(id)
    try:
        db.session.delete(c) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    c = Card.query.get_or_404(id)
    if 'name' not in request.json and 'rarity' not in request.json and 'type' not in request.json and 'color_identity' not in request.json and 'cmc' not in request.json and 'set_id' not in request.json:
        return abort(400)
    if 'name' in request.json:
        c.name = request.json['name']
    if 'rarity' in request.json:
        c.rarity = request.json['rarity']
    if 'type' in request.json:
        c.type = request.json['type']
    if 'color_identity' in request.json:
        c.color_identity = request.json['color_identity']
    if 'cmc' in request.json:
        c.cmc = request.json['cmc']
    if 'set_id' in request.json:
        c.set_id = request.json['set_id']

    try:
        db.session.commit()
        return jsonify(c.serialize())
    except:
        return jsonify(False)

@bp.route('/creatures', methods=['GET']) # decorator takes path and list of HTTP verbs
def creatures():
    cards = Card.query.filter(Card.type.like('%Creature%')) # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/artifacts', methods=['GET']) # decorator takes path and list of HTTP verbs
def artifacts():
    cards = Card.query.filter(Card.type.like('%Artifact%')) # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/instants', methods=['GET']) # decorator takes path and list of HTTP verbs
def instants():
    cards = Card.query.filter(Card.type.like('%Instant%')) # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/sorceries', methods=['GET']) # decorator takes path and list of HTTP verbs
def sorceries():
    cards = Card.query.filter(Card.type.like('%Sorcery%')) # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/enchantments', methods=['GET']) # decorator takes path and list of HTTP verbs
def enchantments():
    cards = Card.query.filter(Card.type.like('%Enchantment%')) # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response

@bp.route('/lands', methods=['GET']) # decorator takes path and list of HTTP verbs
def lands():
    cards = Card.query.filter(Card.type.like('%Land%')) # ORM performs SELECT query
    result = []
    for c in cards:
        result.append(c.serialize()) 
    return jsonify(result) # return JSON response











