from flask import Flask
import sys
import json
app = Flask(__name__)
#app.debug = True
#app.testing = True

@app.route("/")
def hello():
	return json.dumps({"body": "From machine h4"})

@app.route("/healthcheck")
def check():
	return json.dumps({"health": 1})

@app.route("/data")
def data():
	return json.dumps({"data":"Lorem Issum"})

@app.route("/version")
def version():
	return json.dumps({"version":data['version']})

@app.route("/get")
def get():
	return json.dumps({"message":data['message'], "service":data['service']})



argv = sys.argv
if(len(argv)  == 2):
	portNum = argv[1]
else:
	print(" enter port number")
	exit()

data = {}
with open("./config.json") as json_data_file:
    	data = json.load(json_data_file)

if __name__ == "__main__":
	app.run(host="0.0.0.0", port=portNum)
