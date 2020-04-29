from flask import Blueprint
from flask import json
from flask import jsonify, make_response
from models.response import Response


blueprint = Blueprint('home_controller', __name__)

@blueprint.route('/')
def index():
    response = Response()
    response.message = "I'm the home controller"
    return make_response(jsonify(response.__dict__), 200)