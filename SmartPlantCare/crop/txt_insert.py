import requests
from bs4 import BeautifulSoup
import sqlite3
import pandas as pd
from datetime import datetime
import numpy as np
from bokeh.plotting import figure
from bokeh.layouts import column 
from bokeh.models import ColumnDataSource, CustomJS,HoverTool # Use UISelect instead of Select
#from bokeh.models.widgets.inputs import Select
#from bokeh.layouts import column
#import json
from bokeh.embed import components

url = 'https://penteli.meteo.gr/stations/heraclion/NOAAMO.TXT'
con=sqlite3.connect("C:/Users/nikos/Desktop/smart-plant-care/flask_crops_database.db")

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
}

def get_weather(url):
    data = []
    try:

        html_text = requests.get(url ,headers=headers).text
        soup = BeautifulSoup(html_text, "html.parser")

        data = soup.get_text()

    except Exception as e:
        print("error:",e)
        pass

    return data

def txt_to_df(data):
        cols=['DAY','MEAN_TEMP','HIGH','TIME_H','LOW','TIME_L','MAX_RH','MIN_RH','RAIN','AVG_WIND_SPEED','HIGH_W','TIME_W','DOM_DIR']
        lines = data.split("\n")
        selected_lines = lines[10:41]
        stripped = [line.strip() for line in selected_lines] 
        lines = [line.split() for line in stripped if line]
        cleaned_lines = [[value if value != '---' else np.nan for value in row] for row in lines]
        df = pd.DataFrame(cleaned_lines,columns=cols)
        df= df.astype({"MEAN_TEMP": float, "HIGH": float, "TIME_H": str, "LOW": float, "TIME_L": str, "MAX_RH": float, "MIN_RH": float, "RAIN": float, "AVG_WIND_SPEED": float, "HIGH_W": float, "TIME_W": str, "DOM_DIR": str})
        df = df[df['DAY'].str.len() < 3 ]
        df.reset_index(drop=True, inplace= True)
        currentDate = str(datetime.today().strftime('%Y/%m'))
        df['DAY'] = currentDate + "/" + df['DAY'].astype(str)
        df['DAY'] = pd.to_datetime(df['DAY'])
        return df



'''
def create_plots(df):
    df['DAY'] = pd.to_datetime(df['DAY'])
    plot_df = df.copy()
    plot_df['MonthYear'] = plot_df['DAY'].dt.to_period('M').astype(str)
    plot_df = plot_df.replace({np.nan: None})

    month_data = {
        month: {
            'x': plot_df[plot_df['MonthYear'] == month]['DAY'].dt.strftime('%Y-%m-%d').tolist(),
            'y1': plot_df[plot_df['MonthYear'] == month]['HIGH'].tolist(),
            'y2': plot_df[plot_df['MonthYear'] == month]['MEAN_TEMP'].tolist(),
            'y3': plot_df[plot_df['MonthYear'] == month]['LOW'].tolist(),
        }
        for month in plot_df['MonthYear'].unique()
    }
    initial_month = plot_df['MonthYear'].unique()[0] if len(plot_df['MonthYear'].unique()) > 0 else None

    
    initial_month = plot_df['MonthYear'].unique()[0]
    initial_dict = month_data[initial_month]

    
    #initial_dict = delete_none(initial_dict)
    print(initial_dict)
    
    source = ColumnDataSource(data={
        'x': pd.to_datetime(initial_dict['x']), 
        'y1': initial_dict['y1'],
        'y2': initial_dict['y2'],
        'y3': initial_dict['y3'],
    })

  

    p = figure(title="Θερμοκρασία ανά Μήνα", x_axis_label="Ημερομηνία", 
    x_axis_type="datetime", y_axis_label="Θερμοκρασία", width=600, height=350)


    p.line('x', 'y1', source=source, legend_label="Μέγιστη Θερμοκρασία", color='red', line_width=2)
    p.scatter('x', 'y1',source=source,fill_color="red", size = 8)
    p.line('x', 'y2', source=source, legend_label="Μέση Θερμοκρασία", color='yellow', line_width=2)
    p.scatter('x', 'y2',source=source,fill_color="yellow", size = 8)
    p.line('x', 'y3', source=source, legend_label="Χαμηλή Θερμοκρασία", color='blue', line_width=2)
    p.scatter('x', 'y3',source=source,fill_color="blue", size = 8)


    # Set x_range dynamically
    p.x_range.start = pd.Timestamp("2025-01-01")
    p.x_range.end = pd.Timestamp("2025-02-01")
    p.y_range.start = 0
    p.y_range.end = 40 

    dropdown = Select(title="Επιλέξτε Μήνα", value=initial_month, options=list(month_data.keys()))
    month_data_json = json.dumps(month_data)

    callback = CustomJS(args=dict(source=source, month_data=month_data_json), code="""
        var selected_month = cb_obj.value;
        var new_data = JSON.parse(month_data)[selected_month];

        // Convert date strings to Date objects
        new_data.x = new_data.x.map(x => new Date(x));

        // Ensure the source data is updated correctly
        source.data = {
            x: new_data.x,
            y1: new_data.y1,
            y2: new_data.y2,
            y3: new_data.y3
        };
        source.change.emit();
    """)

    dropdown.js_on_change('value', callback)
    layout = column(p,dropdown)

    script, div = components(layout)
    return script, div
'''

def create_plots(df):
     df['DAY'] = pd.to_datetime(df['DAY'])

     source = ColumnDataSource(data=dict(
        Ημερομηνία=df['DAY'], 
        y1=df['HIGH'],
        y2=df['MEAN_TEMP'],
        y3=df['LOW'],
        y4=df['MAX_RH'],
        y5=df['MIN_RH'],
        y6=df['RAIN'],
     ))


     hover_tool = HoverTool(
      tooltips = [
       ('Ημερομηνία', '@Ημερομηνία{%F}'),
       ('Μέγιστη Θερμοκρασία', '@y1{0.0}'),
       ('Μέση Θερμοκρασία', '@y2{0.0}'),
       ('Ελάχιστη Θερμοκρασία', '@y3{0.0}')
     ],
      formatters={
           '@Ημερομηνία' : 'datetime'
      },
      mode = "mouse"
    )

     
     t = figure(title = "Θερμοκρασία", x_axis_label = "Ημερομηνία",x_axis_type = "datetime", y_axis_label = "Θερμοκρασία",width = 600, height = 350)
     t.line('Ημερομηνία','y1', legend_label = "Μέγιστη Θερμοκρασία",color ='red', line_width =2,source=source)
     t.scatter('Ημερομηνία','y1',color = 'red',source=source)
     t.line('Ημερομηνία','y2', legend_label = "Μέση Θερμοκρασία",color = 'yellow', line_width =2,source=source)
     t.scatter('Ημερομηνία','y2',color = 'yellow',source=source)
     t.line('Ημερομηνία','y3', legend_label = "Χαμηλή Θερμοκρασία",color = 'blue', line_width =2,source=source)
     t.scatter('Ημερομηνία','y3',color = 'blue',source=source)
     t.add_tools(hover_tool)



     hover_tool1 = HoverTool(
      tooltips = [
       ('Ημερομηνία', '@Ημερομηνία{%F}'),
       ('Μέγιστη Υγρασία', '@y4{0.0}%'),
       ('Ελάχιστη Υγρασία', '@y5{0.0}%'),
       ('Βροχή', '@y6{0.0}')
     ],
      formatters={
           '@Ημερομηνία' : 'datetime'
      },
      mode = "mouse"
    )

     r = figure(title = "Υγρασία/Βροχή", x_axis_label = "Ημερομηνία",x_axis_type = "datetime", y_axis_label = "Υγρασία/Βροχή",width = 600, height = 350)
     r.line('Ημερομηνία','y4', legend_label = "Μέγιστη Υγρασία(%)",color ='red', line_width =2,source=source)
     r.scatter('Ημερομηνία','y4',color = 'red',source = source)
     r.line('Ημερομηνία','y5', legend_label = "Ελάχιστη Υγρασία(%)",color = 'blue', line_width =2,source = source)
     r.scatter('Ημερομηνία','y5',color = 'blue',source = source)
     r.line('Ημερομηνία','y6', legend_label = "Βροχή(mm)",color = 'yellow', line_width =2,source=source)
     r.scatter('Ημερομηνία','y6',color = 'yellow',source=source)
     r.add_tools(hover_tool1)
     
     p = column(t,r)
     
     script, div = components(p)
     return script, div


data = get_weather(url)
df = txt_to_df(data)
create_plots(df)

cursor = con.execute("SELECT DAY FROM monthly_weather")  
existing_dates = {datetime.strptime(row[0].split(' ')[0], "%Y-%m-%d").date() for row in cursor.fetchall()}  

cols = ['MEAN_TEMP', 'HIGH', 'TIME_H', 'LOW', 'TIME_L', 'MAX_RH', 'MIN_RH', 'RAIN', 'AVG_WIND_SPEED', 'HIGH_W', 'TIME_W', 'DOM_DIR']
set_clause = ", ".join([f"{col} = ?" for col in cols])
columns_str = ", ".join(["DAY"] + cols)
placeholders = ", ".join(["?"] * (len(cols) + 1))  # One extra for DAY

for i in range(df.shape[0]):
    row_date = df.iloc[i]['DAY'].date()  # Extract date from dataframe
    values = tuple(float(val) if isinstance(val, np.float64) else val for val in df.iloc[i, 1:].values)

    if row_date in existing_dates:  # If the row already exists, update it
        sql_query = f"""UPDATE "monthly_weather" SET {set_clause} WHERE strftime('%Y-%m-%d', DAY) = ?"""
        cursor.execute(sql_query, values + (row_date,))
        print(f"Updated row for {row_date}")

    else:  # If the row does not exist, insert a new one
        sql_query = f"""INSERT INTO "monthly_weather" ({columns_str}) VALUES ({placeholders})"""
        cursor.execute(sql_query, (row_date,) + values)
        print(f"Inserted new row for {row_date}")

print("Committing changes...")
con.commit()
con.close()