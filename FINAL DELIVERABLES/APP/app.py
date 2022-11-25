from flask import Flask, render_template, request
import qrcode
from PIL import Image
import MySQLdb.cursors
from flask_mysqldb import MySQL
import requests
from bs4 import BeautifulSoup
import pandas as pd
app = Flask(__name__)

app.config["MYSQL_HOST"] = "localhost"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "Grapes$1"
app.config["MYSQL_DB"] = "train"
mysql = MySQL(app)

train_no = ""
@app.route('/home', methods = ['POST', 'GET'])
def home():
    if(request.method == 'POST'):
        username = request.form['username']
        tel = request.form['phoneno']
        email = request.form['email']
        date = request.form['date']
        source = request.form['source']
        destination = request.form['destination']
        seat = request.form['seat']
        trainname = request.form['trainname']
        classname = request.form['classType']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT train_id, startTime, endTime, SourceStation, DestinationStation FROM traintable WHERE train_name = % s', (trainname,))
        trainDetails = cursor.fetchone()
        price = trainprice(source, destination, classname)
        price  = price * int(seat)
        train_id = str(trainDetails.get('train_id'))
        print(train_id) 
        global train_no
        train_no = train_id 
        details = "Username:"+username+"\nTelephone:"+tel+"\nEmail:"+email+"\nDate of Departing:"+date+"\nSource:"+source+"\nDestination:"+destination+"\nTrain No:"+train_id+"\nTrain name:"+trainname+"\nSeat booked:"+seat+"\nClass Type:"+classname+"\nLeaving time:"+str(trainDetails.get('startTime'))
        img = qrcode.make(details)
       
        
        
        # trainLocation(train_id)
        img.save('D:\\ELCOT\\Downloads\\Train-ticket-booking-system-main\\Train-ticket-booking-system-main\\Ibm Project-SSFR\\static\image\\qrcode.jpg')
        filename = 'qrcode.jpg'
        return render_template('qrcode.html', filename = filename, locatiom = "")
    return render_template('indexs.html')


def trainprice(source, destination, classname):
    if (source == 'chennai' and destination == 'hyderbad') or (source == 'hyderbad' and destination == 'chennai'):
        if(classname == '1AC'):
            return 1450
        elif(classname == '2AC'):
            return 1200
        elif(classname == 'FC'):
            return 800
        elif(classname == 'SL'):
            return 700
        elif(classname == '2S'):
            return 600
        else:
            return 450
    elif (source == 'chennai' and destination == 'kolkata') or (source == 'kolkata' and destination == 'chennai'):
        if(classname == '1AC'):
            return 2450
        elif(classname == '2AC'):
            return 2200
        elif(classname == 'FC'):
            return 1800
        elif(classname == 'SL'):
            return 1700
        elif(classname == '2S'):
            return 1200
        else:
            return 1000
    elif (source == 'chennai' and destination == 'pondicherry') or (source == 'pondicherry' and destination == 'chennai'):
        if(classname == '1AC'):
            return 450
        elif(classname == '2AC'):
            return 200
        elif(classname == 'FC'):
            return 150
        elif(classname == 'SL'):
            return 120
        elif(classname == '2S'):
            return 100
        else:
            return 90
    elif (source == 'kolkata' and destination == 'hyderbad') or (source == 'hyderbad' and destination == 'kolkata'):
        if(classname == '1AC'):
            return 1450
        elif(classname == '2AC'):
            return 1200
        elif(classname == 'FC'):
            return 800
        elif(classname == 'SL'):
            return 700
        elif(classname == '2S'):
            return 600
        else:
            return 450
    elif (source == 'pondicherry' and destination == 'hyderbad') or (source == 'hyderbad' and destination == 'pondicherry'):
        if(classname == '1AC'):
            return 1250
        elif(classname == '2AC'):
            return 1000
        elif(classname == 'FC'):
            return 800
        elif(classname == 'SL'):
            return 700
        elif(classname == '2S'):
            return 600
        else:
            return 450
    elif (source == 'kolkata' and destination == 'pondicherry') or (source == 'pondicherry' and destination == 'kolkata'):
        if(classname == '1AC'):
            return 2950
        elif(classname == '2AC'):
            return 2300
        elif(classname == 'FC'):
            return 2100
        elif(classname == 'SL'):
            return 1900
        elif(classname == '2S'):
            return 1500
        else:
            return 1000
    else:
        return 1000

@app.route('/location', methods=['GET', 'POST'])
def trainLocation():
    url = "https://www.railyatri.in/live-train-status/"+train_no
    print(type(train_no))

    htmldata = getdata(url)
    soup = BeautifulSoup(htmldata, 'html.parser')

    data = []
    for item in soup.find_all('script', type="application/ld+json"):
        data.append(item.get_text())

    print(len(data))
    df = pd.read_json(data[2])
    print(df["mainEntity"][0]['acceptedAnswer']['text'])
    return render_template("qrcode.html", filename = '/qrcode.jpg', location = df["mainEntity"][0]['acceptedAnswer']['text'])


def getdata(url):
	r = requests.get(url)
	return r.text

app.debug = True
app.run(port=5000)