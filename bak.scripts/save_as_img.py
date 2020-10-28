import requests
import time
img_list = []

for i in range(88):
    url = "https://transcode-result-1259648581.file.myqcloud.com/04d6ie38gtgtvskp47rb/{0}.jpg".format(i)
    img_list.append(url)

def run(url,_i):
    img_url = url
    _i = str(_i)
    img_name = _i + ".jpg"
    img = requests.get(img_url) 
    f = open(img_name,'ab')  # 存储图片，多媒体文件需要参数b（二进制文件）
    f.write(img.content)  # 多媒体存储content
    f.close()
    print(_i)
    time.sleep(1)
    return None

_int = 1

for i in img_list:
    run(i,_int)
    _int = _int+1
