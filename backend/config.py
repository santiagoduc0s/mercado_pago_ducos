import json

def load_config():
    with open("env.json", "r") as f:
        return json.load(f)
