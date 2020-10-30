import requests
import ping3
import telnetlib
import logging
import time
import datetime

"""
changer log
--03/25/20
    add DEBUG mode;
--04/03/20
    fix DEBUG 无法处理部分 requests 请求的数据;
--05/21/20
    add 其他服务器 IP;
--05/25/20
    Pending datetime、file、name
--06/23/20
    因为初始化的问题无法随机变更文件名称，需要更改为对象式编程，没有问题就不维护了。
--07/09/20
    改进 __init__ 类的初始化；
    清除不必要的代码；
--07/21/20
    改进分类，以 ICMP、STMP、HTTP 等协议划分，目的旨在从不同层面去了解它们的运行情况，通常只能确保其开机或服务已开启的状态；
--

"""

class Check:
    ip = [
        '192.168.33.255',
    ]
    urls = [
        'https://www.google.com',
        'https://www.office.com',
    ]
    dns = [

        '223.5.5.5',
        '8.8.8.8',
    ]

    def __init__(self,filename):
        self.filename = filename
        file_name = self.get_date()
        file_name = "./bak.historyfile/" + file_name + ".LOG"
        # logging - basicConfig 
        self.logger = logging.getLogger("Network")
        self.logger.setLevel(logging.DEBUG)
        formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s: - %(message)s'
            )
        fh = logging.FileHandler(file_name)
        fh.setLevel(logging.DEBUG)
        ch = logging.StreamHandler()
        ch.setLevel(logging.DEBUG)
        ch.setFormatter(formatter)
        self.logger.addHandler(ch)
        self.logger.addHandler(fh)  

    def checkIP(self, _ip):
        title = "[ X ] "
        _check = ping3.ping(_ip, timeout=2)
        if _check != None:
            title = "[ O ] "
        self.logger.info(title + _ip)
        return None

    def checkURLS(self, _urls):
        title = None
        try:
            get = requests.get(url=_urls, timeout=2)
            title = "[ O ] "
        except:
            title = "[ X ] "
        self.logger.info(title + _urls)
        return None
    def checkURLS_copy(self, _urls):
        # 测试完成，不再使用
        try:
            get = requests.get(url=_urls, timeout=2)
            print("O")
            return None
        except:
            print("X")
            return None

    def checkNDS(self):
        # 不使用
        pass

    def Text(self):
        pass

    def do_telnet(self, Host):
        '''Telnet远程测试连接：客户端连接Linux服务器'''
        return_s = None
        try:
            tn = telnetlib.Telnet(Host, port=25, timeout=5)
            tn.close()  # tn.write('exit\n')
        except:
            return_s = "[ X ]"
            self.logger.info("%s %s,25 ( STMP-Server ) ", return_s,Host)
            return return_s
            # logging.warning("%s, 192.168.33.247,25 ( FAB-STMP-Server ) ",return_s)
        return_s = "[ O ]"
        self.logger.info("%s %s,25 ( STMP-Server ) ", return_s,Host)
        return return_s

    def Start(self):
        # Program Info
        import datetime
        # self.set_logger()
        print("-"*100)
        self.logger.debug("\n\n ## ICMP 协议 \n")
        for i in self.ip:
            self.checkIP(i)
            time.sleep(0.2)
        for i1 in self.dns:
            self.checkIP(i1)

        self.logger.debug("\n\n ## STMP 协议 \n")
        self.do_telnet("192.168.33.247")
        self.do_telnet("192.168.31.247")
        
        self.logger.debug("\n\n ## HTTP 协议 \n")
        for i2 in self.urls:
            self.checkURLS(i2)
            # self.checkURLS_copy(i2)
            time.sleep(0.5)
        # print(self.logger.error("new error test ! "))

        print("-"*100)
    
    def get_date(self):
        # get time to list. API(list) 1.date; 2.time;
        dt = datetime.datetime.now()
        filename = "{0}-{1}-{2}".format(dt.year, dt.month, dt.day)
        filetime = "{0}-{1}-{2}".format(dt.hour, dt.minute, dt.second)
        file = [filename,filetime]
        file_name = filename+"-"+filetime
        return filename
    
    def To_local(self):
        pass

def get_date():
        # get time to list. API(list) 1.date; 2.time;
        dt = datetime.datetime.now()
        filename = "{0}-{1}-{2}".format(dt.year, dt.month, dt.day)
        filetime = "{0}:{1}:{2}".format(dt.hour, dt.minute, dt.second)
        # file = [filename,filetime]
        file_name = filename+"-"+filetime
        return file_name

# if __name__ == "___main__":
filename = get_date()
filename = filename + ".LOG"
check = Check(filename=filename)
check.Start()