from flask import Blueprint, jsonify, abort, request
from ..models import Event, db
import hashlib
import secrets

bp = Blueprint('events', __name__, url_prefix='/events')

@bp.route('', methods=['GET']) 
def index():
    events = Event.query.all()
    result = []
    for e in events:
        result.append(e.serialize())
    return jsonify(result)

@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    e = Event.query.get_or_404(id, "Event not found")
    return jsonify(e.serialize())

@bp.route('', methods=['POST'])
def create():
    # Title, date and presenter must be provided
    if 'title' not in request.json and 'date' not in request.json and 'presenter_id' not in request.json: 
        return abort(400)
    event = Event(
        title=request.json['title'],
        description=request.json['description'],
        date=request.json['date'],
        price=request.json['price'],
        presenter_id=request.json['presenter_id']
    )
    db.session.add(event)
    db.session.commit()
    return jsonify(event.serialize())