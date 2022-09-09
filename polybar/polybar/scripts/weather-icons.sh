#!/bin/python
# -*- coding: utf-8 -*-

# Procedure
# Surf to https://openweathermap.org/city
# Fill in your CITY
# e.g. Antwerp Belgium
# Check url
# https://openweathermap.org/city/2803138
# you will the city code at the end
# create an account on this website
# create an api key (free)
# LANG included thanks to krive001 on discord
# ArcoLinux weatherapp script
# Icons added by gcharalampous

import requests

CITY = "5341704"
API_KEY = "756edce7e9d4c385ef9499a53492678c"
UNITS = "Metric"
UNIT_KEY = "C"
# UNIT_KEY = "F"
LANG = "en"
# LANG = "nl"
# LANG = "hu"


REQ = requests.get(
    "http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(CITY, LANG, API_KEY, UNITS))
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        ICON_ID = REQ.json()["weather"][0]["icon"]
        if ICON_ID == "01d":
            ICON = "%{F#FFB86C}\uf185%{F-}"  # Day, Clear Sky  
        elif ICON_ID == "01n":
            ICON = "%{F#8BE9FD}\uf186%{F-}"  # Night, Clear Sky  
        elif ICON_ID == "02d":
            ICON = "%{F#FFB86C}\ue302%{F-}"  # Day, Few Clouds 
        elif ICON_ID == "02n":
            ICON = "%{F#8BE9FD}\ue37e%{F-}"  # Night, Few Clouds 
        elif ICON_ID == "03d":
            ICON = "%{F#FFB86C}\uf0c2%{F-}"  # Day, Scattered Clouds 
        elif ICON_ID == "03n":
            ICON = "%{F#8BE9FD}\uf0c2%{F-}"  # Night, Scattered Clouds  
        elif ICON_ID == "04d":
            ICON = "%{F#FFB86C}\ue312%{F-}"  # Day, Broken Clouds  
        elif ICON_ID == "04n":
            ICON = "%{F#8BE9FD}\ue312%{F-}"  # Night, Broken Clouds 
        elif ICON_ID == "09d":
            ICON = "%{F#FFB86C}\ue309%{F-}"  # Day, Shower Rain 
        elif ICON_ID == "09n":
            ICON = "%{F#8BE9FD}\ue334%{F-}"  # Night, Shower Rain 
        elif ICON_ID == "10d":
            ICON = "%{F#FFB86C}\ue308%{F-}"  # Day, Rain 
        elif ICON_ID == "10n":
            ICON = "%{F#8BE9FD}\ue325%{F-}"  # Night, Rain 
        elif ICON_ID == "11d":
            ICON = "%{F#FFB86C}\ue30f%{F-}"  # Day, Thunderstorm 
        elif ICON_ID == "11n":
            ICON = "%{F#8BE9FD}\ue32a%{F-}"  # Night, Thunderstorm 
        elif ICON_ID == "13d":
            ICON = "%{F#bd93f9}\uf2dc%{F-}"  # Day, Snow 
        elif ICON_ID == "13n":
            ICON = "%{F#bd93f9}\uf2dc%{F-}"  # Night, Snow  
        elif ICON_ID == "50d":
            ICON = "%{F#FFB86C}\ue303%{F-}"  # Day, Mist 
        elif ICON_ID == "50n":
            ICON = "%{F#8BE9FD}\ue346%{F-}"  # Night, Mist 
        else:
            ICON = "ICON_NOT_FOUND"

        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{} {}, {} °{}".format(ICON, CURRENT, TEMP, UNIT_KEY))
    else:
        print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
except (ValueError, IOError):
    print("Error: Unable print the data")
