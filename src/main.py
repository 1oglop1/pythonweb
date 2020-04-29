from flask import Flask
import ptvsd

# Allow the host machine to connect to the debugger
ptvsd.enable_attach(address=('0.0.0.0', 3000), redirect_output=True)


# Starts the Flask application
app = Flask(__name__)

# Register the controllers to the application
from controllers import home_controller
app.register_blueprint(home_controller.blueprint)
