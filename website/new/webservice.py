from flask import Flask
import sys
import json
app = Flask(__name__)
#app.debug = True
#app.testing = True

@app.route("/")
def hello():
	return json.dumps({"body": "From machine " + hostNumber})

@app.route("/healthcheck")
def check():
	return json.dumps({"health": 1})

@app.route("/data")
def data():
	return json.dumps({"data":"Lorem Issum"})

@app.route("/version")
def version():
	return json.dumps({"version":'2.0.1', "machine": hostNumber})

@app.route("/get")
def get():
	return json.dumps({"message": "From machine " + hostNumber, "service":"webservice"})

argv = sys.argv
if(len(argv)  == 2):
	hostNumber = argv[1]
else:
	print(" enter machineNumber")
	exit()


if __name__ == "__main__":
	app.run(host="0.0.0.0", port=80)

