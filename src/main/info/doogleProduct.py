import re
import time
from selenium import webdriver
import requests
from bs4 import BeautifulSoup
driver=webdriver.Chrome('data\\chromedriver1')
categorylist=['907','908','909','910','911','912','913','914','915','916','918','919','249','032','012','085','991']
# '907','908','909','910','911','912','913','914','915','916','918','919','249','032','012','085','991'

def getSource(category, mid, items):
    for item in items:
        imgurl = item.find_element_by_tag_name('img').get_attribute('src')
        title = item.find_element_by_css_selector('span.name').text
        title = re.sub('[ =.#/?:$}*]', '', title)
        price = item.find_element_by_css_selector('span.price').text.replace(',', '').replace('원', '')
        subtitle = item.find_element_by_css_selector('span.desc').text
        if '%' in item.find_element_by_css_selector('span.cost').text:
            dc = item.find_element_by_css_selector('span.dc').text.replace('%', '')
        else:
            dc = ''
        filename = 'img1/' + title + imgurl[-4:]
        print(filename)
        print(title)
        r = requests.get(imgurl)
        with open(filename, 'wb') as f:
            f.write(r.content)
        with open('doogle\\item.csv', 'a', encoding='utf-8') as f:
            f.write('{},{},{},{},{},{}\n'.format(category, mid, title, dc, price, subtitle))

for c in categorylist:
    url="https://www.kurly.com/shop/goods/goods_list.php?category="+c
    driver.get(url)
    time.sleep(2)
    moves=driver.find_elements_by_css_selector('#lnbMenu > div.inner_lnb > ul > li')
    for move in moves[1:-1]:
        a=move.find_element_by_tag_name('a')
        a.click()
        time.sleep(2)
        category=driver.current_url[-3:]
        mid=a.text
        items=driver.find_elements_by_css_selector('#goodsList > div.list_goods > div > ul > li> div')
        spans=driver.find_elements_by_css_selector('#goodsList > div.layout-pagination > div > span')
        countSpan = len(driver.find_elements_by_css_selector('#goodsList > div.layout-pagination > div > span'))
        if countSpan>1:
            for i in range(1, countSpan + 1):
                getSource(category, mid, items)
                if i < countSpan:
                    spans[i].find_element_by_tag_name('a').click()
                    time.sleep(3)
                    items = driver.find_elements_by_css_selector('#goodsList > div.list_goods > div > ul > li> div')
        else:
            getSource(category, mid, items)

