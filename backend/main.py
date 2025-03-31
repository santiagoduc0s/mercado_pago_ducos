from flask import Flask
from routes.preferences import preferences_bp
from routes.subscriptions import subscriptions_bp
from routes.plans import plans_bp
from routes.events import events_bp

app = Flask(__name__)

# Register blueprints for modular routes
app.register_blueprint(preferences_bp)
app.register_blueprint(subscriptions_bp)
app.register_blueprint(plans_bp)
app.register_blueprint(events_bp)

if __name__ == "__main__":
    app.run(debug=True)
