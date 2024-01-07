import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    user_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)
    email = db.Column(db.String(128), nullable=False)
    orders = db.relationship('Order', backref='user', lazy=True)

    def __init__(self, first_name, last_name, email):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def serialize(self):
        return {
            'user_id': self.user_id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
        }


class Presenter(db.Model):
    __tablename__ = 'presenters'
    presenter_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    email = db.Column(db.String(128), nullable=False)        
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    events = db.relationship('Event', backref='presenter', lazy=True)

    def __init__(self, name, email, user_id):
        self.name = name
        self.email = email
        self.user_id = user_id

    def serialize(self):
        return {
            'presenter_id': self.presenter_id,
            'name': self.name,
            'email': self.email,
            'user_id': self.user_id
        }


class Event(db.Model):
    __tablename__ = 'events'
    event_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(128), nullable=False)
    description = db.Column(db.Text, nullable=True)
    date = db.Column(db.Date, nullable=False)
    start_time = db.Column(db.Time, nullable=True)
    end_time = db.Column(db.Time, nullable=True)
    price = db.Column(db.Float, default=0.00, nullable=True)
    presenter_id = db.Column(db.Integer, db.ForeignKey('presenters.presenter_id'), nullable=False)

    def __init__(self, title, description, date, time, price, presenter_id):
        self.title = title
        self.description = description
        self.date = date
        self.start_time = start_time
        self.end_time = end_time
        self.price = price
        self.presenter_id = presenter_id

    def serialize(self):
        return {
            'event_id': self.event_id,
            'title': self.title,
            'description': self.description,
            'date': self.date,
            'start_time': self.start_time,
            'end_time': self.end_time,
            'price': self.price,
            'presenter_id': self.presenter_id
        }

class Tag(db.Model):
    __tablename__ = 'tags'
    tag_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    title = db.Column(db.String(120), nullable=False)

    def __init__(self, title):
        self.title = title
    
    def serialize(self):
        return {
            'tag_id': self.tag_id,
            'title': self.title
        }


events_tags_table = db.Table(
    'events_tags',
    db.Column(
        'event_id', db.Integer,
        db.ForeignKey('events.event_id'),
        primary_key=True
    ),

    db.Column(
        'tag_id', db.Integer,
        db.ForeignKey('tags.tag_id'),
        primary_key=True
    )
)


class TicketOrder(db.Model):
    __tablename__ = 'ticket_orders'
    order_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    event_id = db.Column(db.Integer, db.ForeignKey('events.event_id'), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'), nullable=False)
    total = db.Column(db.Float, default=0.00, nullable=False)
    date_reserved = db.Column(db.DateTime, default=datetime.datetime.utcnow, nullable=False)

    def __init__(self, event_id, user_id, total):
        self.event_id = event_id
        self.user_id = user_id
        self.total = total

    def serialize(self):
        return {
            'order_id': self.order_id,
            'event_id': self.event_id,
            'user_id': self.user_id,
            'total': self.total,
            'date_reserved': self.date_reserved
        }
