import time
import random
i=0
while(i<=2000):
    i=i+1
    time.sleep(10) #2 SEC DELAY
    temp=random.randint(20,40)
    humid=random.randint(50,100)
    if temp>30:
        print("Temperature:",temp,"°C\n Temperature is High\n !!! ALERT HIGH TEMPERATURE !!!")
    else:
        print("Temperature:",temp,"°C\n Temperature is Normal")
    if humid>70:
        print("Humidity:",humid,"\nHumidity is high")
    else:
        print("Humidity:",humid,"\nHumidity is low")