from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Account(db.Model):
    __tablename__ = 'accounts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    email = db.Column(db.String(128), unique=True, nullable=False)

    def __init__(self, username: str, password: str, email: str):
        self.username = username
        self.password = password
        self.email = email

    def serialize(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email
        }


class Player(db.Model):
    __tablename__ = 'players'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    account_id = db.Column(db.Integer, db.ForeignKey(
        'accounts.id'), unique=True, nullable=False)

    def __init__(self, name: str, account_id: str):
        self.name = name
        self.account_id = account_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'account_id': self.account_id
        }


class Deck(db.Model):
    __tablename__ = 'decks'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    size = db.Column(db.Integer, nullable=False)
    player_id = db.Column(db.Integer, db.ForeignKey(
        'players.id'), nullable=False)

    def __init__(self, name: str, size: int, player_id: int):
        self.name = name
        self.size = size
        self.player_id = player_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'size': self.size,
            'player_id': self.player_id
        }


decks_cards_table = db.Table(
    'decks_cards',
    db.Column(
        'deck_id', db.Integer,
        db.ForeignKey('decks.id'),
        primary_key=True
    ),

    db.Column(
        'card_id', db.Integer,
        db.ForeignKey('cards.id'),
        primary_key=True
    )
)


class Card(db.Model):
    __tablename__ = 'cards'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    rarity = db.Column(db.String(128), nullable=False)
    type = db.Column(db.String(128), nullable=False)
    color_identity = db.Column(db.String(128), nullable=False)
    cmc = db.Column(db.Integer, nullable=False)
    set_id = db.Column(db.Integer, db.ForeignKey('sets.id'), nullable=False)
    decks = db.relationship(
        'Deck', secondary=decks_cards_table,
        lazy='subquery',
        backref=db.backref('cards_in_deck', lazy=True)
    )

    def __init__(self, name: str, rarity: str, type: str, color_identity: str, cmc: int, set_id: int):
        self.name = name
        self.rarity = rarity
        self.type = type
        self.color_identity = color_identity
        self.cmc = cmc
        self.set_id = set_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'rarity': self.rarity,
            'type': self.type,
            'color_identity': self.color_identity,
            'cmc': self.cmc,
            'set_id': self.set_id
        }


class Set(db.Model):
    __tablename__ = 'sets'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)

    def __init__(self, name: str):
        self.name = name

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name
        }
