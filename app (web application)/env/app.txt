from pyrebase import pyrebase
from flask import Flask , jsonify
from flask import * 
from flask import Flask, render_template, request, json, Response,redirect,flash,url_for, session
from random import seed
from random import randint
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
seed(1)

app = Flask(__name__)
app.config["FLASK_ENV"] = "development"
app.config["DEBUG"] = True
app.config["FLASK_APP"]="app.py"
app.secret_key="hmsapp"

firebaseConfig = {
  "apiKey": "AIzaSyDpud5Z-ztaIf61L7MatWs7hBbBo2pII5k",
  "authDomain": "hmsdatabases.firebaseapp.com",
  "databaseURL": "https://hmsdatabases-default-rtdb.firebaseio.com",  
  "projectId": "hmsdatabases",
  "storageBucket": "hmsdatabases.appspot.com",
  "messagingSenderId": "214697473775",
  "appId": "1:214697473775:web:fe193c250df62dc3b6cd1a",
  "measurementId": "G-CZKEDJ716D"
}

cred = credentials.Certificate('C:/Users/ASHWINSURENDAR/Desktop/app/env/hmsdatabases-firebase-adminsdk-is5wo-f2809d0763.json')
firebase_admin.initialize_app(cred)
db = firestore.client()
firebase = pyrebase.initialize_app(firebaseConfig)
auth = firebase.auth()
#db = firebase.database() 
print(db)


# import os
# BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
# print(BASE_DIR)

def RandomHealthData():
    heartbeat = randint(60, 120)
    bloodsugarlevel = randint(100, 250)
    oxygensaturationlevel = randint(92, 95)
    bloodpressure = randint(60, 65)
    weight = randint(65, 110)
    return {"heartbeat": heartbeat, "bloodsugarlevel": bloodsugarlevel, "oxygensaturationlevel": oxygensaturationlevel, "bloodpressure": bloodpressure, "weight":weight}

@app.route('/',methods=['GET','POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        print(email,password)
        try:
            user = auth.sign_in_with_email_and_password(email,password)
            #print(user)
            session['token']=user['idToken']
            session['email']=email
            if email=="admin@gmail.com":
                return redirect(url_for('admindashboard'))
            # getrecord = RandomHealthData()
            # return render_template('dashboard.html',rcds=getrecord)
            return redirect(url_for('dashboard'))

        except Exception as e:
            print(e)
            return 'Please Check your Credentials'
            
    return render_template('index.html')
@app.route('/create',methods=['POST'])
def createaccount():
    if request.method == 'POST':
        try:
            # print(request.form) 
            name = request.form['username']
            email = request.form['email']
            password = request.form['password']
            print(email,password)
            user = auth.create_user_with_email_and_password(email,password)
            print('User Account Created')
            return 'Account Created Successfully'

        except Exception as e:
            print(e)
            print("could not Create account")
            # return render_template('createaccount.html',us='Couldnt create account')
            return 'Couldnt create account'

    return 'created!!'

@app.route('/dashboard',methods=['GET','POST'])
def dashboard():
    print("session: ",session['token'])
    docs = db.collection('hmsdatas').document(session['email']).get()
    
#    docs = db.collection('hmsdatas').where('doc[id]','==',session['emailid']).stream()
    user = docs.to_dict()
    print(user)
    #name = user.name
    #print("username:" ,name)
    
    getrecord = RandomHealthData()
    getrecord['username']=user['name']
    getrecord['emailid']=session['email']

    print(getrecord)
    #storage.child('./help.txt')
    return render_template('dashboard.html',rcds=getrecord)

@app.route('/admindashboard',methods=['GET','POST'])    
def admindashboard():
    data = {"name": "Mortimer 'Morty' Smith"}
    print("admindashboard: ",session['token'])
    #results = db.child("hmsdatas").push(data)
    #datas = db.collection('hmsdatas').document(session['email'])
    #datas.set({
      #  'name':'ash',
     #   'lname':'win'
    #})
    emps = db.collection('hmsdatas')
    docs = emps.stream()
    empdata = []
    for doc in docs:
        datas={}
        datas = doc.to_dict()
        datas["emailid"]=doc.id
        empdata.append(datas)
        #print(doc.id," ", doc.to_dict())
    print(empdata)
    return render_template('admindashboard.html',rcds=empdata)      
     
if __name__ == '__main__':
	app.run(debug=True) 