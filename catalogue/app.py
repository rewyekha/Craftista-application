from flask import Flask, jsonify, render_template
from datetime import datetime
import socket
import os
import json
from pymongo import MongoClient

app = Flask(__name__)

with open("config.json", "r") as config_file:
    config_data = json.load(config_file)

mongo_uri = f"mongodb://{config_data['db_user']}:{config_data['db_password']}@{config_data['db_host']}:27017/{config_data['db_name']}?authSource=admin"
mongo_client = MongoClient(mongo_uri)
db = mongo_client[config_data["db_name"]]

@app.route('/')
def home():
    system_info = get_system_info()
    app_version = config_data.get("app_version", "N/A")
    return render_template('index.html', current_year=datetime.now().year, system_info=system_info, version=app_version)

@app.route('/api/products', methods=['GET'])
def get_products():
    product_list = list(db.products.find({}, {'_id': 0}))
    return jsonify(product_list), 200

@app.route('/api/products/<int:product_id>', methods=['GET'])
def get_product(product_id):
    product = db.products.find_one({"id": product_id}, {'_id': 0})
    if product:
        return jsonify(product)
    else:
        return jsonify({'message': 'Product not found'}), 404

def get_system_info():
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    is_container = os.path.exists('/.dockerenv')
    is_kubernetes = os.path.exists('/var/run/secrets/kubernetes.io/serviceaccount')
    return {
        "hostname": hostname,
        "ip_address": ip_address,
        "is_container": is_container,
        "is_kubernetes": is_kubernetes
    }

if __name__ == "__main__":
    app.run(debug=True)
