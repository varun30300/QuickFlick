import os 
import requests
import firebase_admin
from firebase_admin import credentials, firestore


KEY = os.getenv('NEWS_API_KEY')

cred = credentials.Certificate("quickflick-19fdd-11e52bcd6a8b.json")
firebase_admin.initialize_app(cred)
db = firestore.client()
doc_ref = db.collection(u'')


# reading the first page 
curr_page = "https://newsdata.io/api/1/news?apikey="+ KEY +"&country=ca&language=en"

page_no = 1
while page_no <= 10 : 
    response = requests.get(curr_page).json()

    for article in response['results']:
        title = article['title']
        link = article['link']
        keyWords = article['keywords']
        author = article['creator']
        description = article['description']
        content = article['content']
        pubDate = article['pubDate']
        image_url = article['image_url']
        source_id = article['source_id']
        category = article['category']
        country = article['country']
        language = article['language']


    page_no += 1
    curr_page = "https://newsdata.io/api/1/news?apikey="+ KEY +"&country=ca&language=en&page=" + response['nextPage']


# iterate and check if link for that date already exists, if yes ignore , if no add that to the news 
