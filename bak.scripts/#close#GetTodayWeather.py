# GetTodayWeather.py
# 中国-广东-佛山 from Weather.com
"""
close this project
由于 weather.com 反爬虫，简单的数据居然是 JavaScript ，亏亏亏！
2020.07.16
"""
import requests
import re
import datetime
import lxml,bs4

urls = "https://weather.com/zh-CN/weather/today/l/f33815ce8be6a138c99d2344da7df3d24b119b3ae10ff4871bb846885c85a175"

class Weather:

    def __init__(self, urls):
        self.urls=urls

    def get_weather(self):
        get = requests.get(url=self.urls)
        try:
            if get.status_code == 200:
                return get
        except:
            return None

    def to_file(self,path,txt):
        with open(path,'wt') as f:
            f.write = txt

    def get_time(self):
        # get time to list. API(list) 1.date; 2.time;
        dt = datetime.datetime.now()
        filename = "{0}-{1}-{2}".format(dt.year, dt.month, dt.day)
        filetime = "{0}:{1}:{2}".format(dt.hour, dt.minute, dt.second)
        file_name = filename+"-"+filetime
        return file_name

    def html_format(self, html):
        pass

    def strat(self):
        get_html = self.get_weather()
        if get_html == None:
            print("https requests error !")
            return

        file_name = self.get_time()
        file_name = "./bak.historyfile/" + file_name + ".log"

        print(get_html.text)
        # _log = self.html_format(get_html)

        # self.to_file(path=file_name, txt=_log)      

if __name__ == "__main__":
    w = Weather(urls=urls)
    w.strat()
