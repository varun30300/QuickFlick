import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime as dt

cred = credentials.Certificate("quickflick-19fdd-11e52bcd6a8b.json")
firebase_admin.initialize_app(cred)
db = firestore.client()

pubDate = "2023-05-27"

a = dt.strptime(pubDate, "%y/%m/%d")

print(a)