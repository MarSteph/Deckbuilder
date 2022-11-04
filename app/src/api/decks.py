from flask import Blueprint, jsonify, abort, request
from ..models import Deck, Card, Set, db, decks_cards_table
import sqlalchemy

bp = Blueprint('decks', __name__, url_prefix='/decks')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    decks = Deck.query.all() # ORM performs SELECT query
    result = []
    for d in decks:
        result.append(d.serialize()) # build list of Tweets as dictionaries
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    d = Deck.query.get_or_404(id)
    return jsonify(d.serialize())

@bp.route('', methods=['POST'])
def create():
    if 'name' not in request.json or 'size' not in request.json or 'player_id' not in request.json:
        return abort(400)
    d = Deck(
        name=request.json['name'],
        size=request.json['size'],
        player_id=request.json['player_id']
    )
        
    db.session.add(d) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(d.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    d = Deck.query.get_or_404(id)
    try:
        db.session.delete(d) # prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    d = Deck.query.get_or_404(id)
    if 'name' not in request.json and 'size' not in request.json and 'player_id' not in request.json:
        return abort(400)
    if 'name' in request.json:
        d.name = request.json['username']
    if 'size' in request.json:
        if request.json['size'] < 60:
            return abort(400)
        d.size = request.json['size']
    if 'player_id' in request.json:
        d.player_id = request.json['player_id']

    try:
        db.session.commit()
        return jsonify(d.serialize())
    except:
        return jsonify(False)

@bp.route('/<int:id>/cards_in_deck', methods=['GET'])
def cards_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    result = []
    count = 0
    for c in d.cards_in_deck:
        result.append(c.serialize())
        count += 1
    return jsonify(count, result)

@bp.route('/<int:id>/creatures_in_deck', methods=['GET'])
def creatures_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    creatures = Card.query.filter(Card.type.like('%Creature%'))
    result = []
    count = 0
    for c in d.cards_in_deck:
        for i in creatures:
            if c == i:
                count += 1
                result.append(c.serialize())
    return jsonify(count, result)

@bp.route('/<int:id>/artifacts_in_deck', methods=['GET'])
def artifacts_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    artifacts = Card.query.filter(Card.type.like('%Artifact%'))
    result = []
    count = 0
    for c in d.cards_in_deck:
        for i in artifacts:
            if c == i:
                count += 1
                result.append(c.serialize())
    return jsonify(count, result)

@bp.route('/<int:id>/enchantments_in_deck', methods=['GET'])
def enchantments_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    enchantments = Card.query.filter(Card.type.like('%Enchantment%'))
    result = []
    count = 0
    for c in d.cards_in_deck:
        for i in enchantments:
            if c == i:
                count += 1
                result.append(c.serialize())
    return jsonify(count, result)

@bp.route('/<int:id>/instants_in_deck', methods=['GET'])
def instants_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    instants = Card.query.filter(Card.type.like('%Instant%'))
    result = []
    count = 0
    for c in d.cards_in_deck:
        for i in instants:
            if c == i:
                count += 1
                result.append(c.serialize())
    return jsonify(count, result)

@bp.route('/<int:id>/sorceries_in_deck', methods=['GET'])
def sorceries_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    sorceries = Card.query.filter(Card.type.like('%Sorcery%'))
    result = []
    count = 0
    for c in d.cards_in_deck:
        for i in sorceries:
            if c == i:
                count += 1
                result.append(c.serialize())
    return jsonify(count, result)

@bp.route('/<int:id>/lands_in_deck', methods=['GET'])
def lands_in_deck(id: int):
    d = Deck.query.get_or_404(id)
    lands = Card.query.filter(Card.type.like('%Land%'))
    result = []
    count = 0
    for c in d.cards_in_deck:
        for i in lands:
            if c == i:
                count += 1
                result.append(c.serialize())
    return jsonify(count, result)



@bp.route('/<int:id>/new_cards', methods=['POST'])
def add_card(id: int):
    if 'card_id' not in request.json:
        return abort(400)
    card_id = request.json['card_id']
    
    Deck.query.get_or_404(id)
    Card.query.get_or_404(card_id)
        
    try:
        stmt = sqlalchemy.insert(decks_cards_table).values(
            deck_id=id, card_id=card_id)
        db.session.execute(stmt)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:deck_id>/new_cards/<int:card_id>', methods=['DELETE'])
def delete_card(deck_id: int, card_id: int):
    
    Deck.query.get_or_404(deck_id)
    Card.query.get_or_404(card_id)
        
    try:
        stmt = sqlalchemy.delete(decks_cards_table).where(
            decks_cards_table.c.deck_id == deck_id, 
            decks_cards_table.c.card_id == card_id)
        db.session.execute(stmt)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)


    
    

