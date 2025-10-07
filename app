from flask import Flask, render_template, jsonify
import csv

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/data")
def data():
    with open("/home/pi/govee_data.csv") as f:
        reader = csv.DictReader(f)
        rows = list(reader)
    return jsonify(rows[-50:])  # 直近50件のみ返す

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
