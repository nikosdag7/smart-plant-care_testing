import requests
from bs4 import BeautifulSoup
import pandas as pd
import sqlite3

url = 'https://penteli.meteo.gr/stations/heraclion/'
con=sqlite3.connect("C:/Users/nikos/Desktop/smart-plant-care/flask_crops_database.db")



headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
}

def get_weather(url):
    data = []
    cols = []
    try:

        cur_data = []

        html_text = requests.get(url ,headers=headers).text
        soup = BeautifulSoup(html_text, "html.parser")

        table = soup.find("div", class_="col_sub dist boxshadow realtime")
        curr_time = table.find("div", class_= "headline gradient").find_all("span")[1].get_text().split(' ')
        cols = ['date','time']
        cur_data.append(curr_time[0])
        cur_data.append(curr_time[1])
        lines = table.find_all("div", class_="line")

        

        for line in lines:
                key = line.find("div", class_="lleft").find("span").get_text(strip=True)
                cols.append(key)
                value = line.find("div", class_="lright").find("span").get_text(strip=True).split(' ')[0]
                cur_data.append(value)

        data.append(cur_data)

    except Exception as e:
        print("error:",e)
        pass

    return data, cols

data, cols = get_weather(url)

df = pd.DataFrame(data, columns=cols)
cursor = con.execute("SELECT * FROM live_weather")
rows = cursor.fetchall()
found = False
for row in rows:
    if row[0] == df['date'].iloc[0] and row[1] == df['time'].iloc[0]:
        found = True
        break
if not found:
    df.to_sql("live_weather", con, if_exists='append', index=False)
         