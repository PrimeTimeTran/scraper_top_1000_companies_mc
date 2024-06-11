import time
import requests

from shared import data_directory

def get_tab(tabId):
    if tabId == 0:
        return 1
    elif tabId == 1:
        return 3
    elif tabId == 2:
        return 8
    elif tabId == 3:
        return 7
    elif tabId == 4:
        return 9

def download_top_1000_companies_data():
    all_pages = []
    headers = {
        'Connection': 'keep-alive',
        'Upgrade-Insecure-Requests': '1',
        'Accept-Language': 'en-US,en;q=0.5',
        'Referer': 'https://www.wallstreetzen.com/',
        'User-Agent': 'Chrome 124 on macOS (Sonoma)',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
    }
    pages_to_scrape = [
            'https://www.wallstreetzen.com/stock-screener/?t=1&p=1&s=mc&sd=desc',
            'https://www.wallstreetzen.com/stock-screener/?t=3&p=1&s=mc&sd=desc',
            'https://www.wallstreetzen.com/stock-screener/?t=8&p=1&s=mc&sd=desc',
            'https://www.wallstreetzen.com/stock-screener/?t=7&p=1&s=mc&sd=desc',
            'https://www.wallstreetzen.com/stock-screener/?t=9&p=1&s=mc&sd=desc'
    ]
    for idx, page in enumerate(pages_to_scrape):
        for i in range(1, 11):
            modified_page = page.replace("p=1", f"p={i}")
            all_pages.append(modified_page)
            response = requests.get(modified_page, headers=headers)
            filename = f"{data_directory}/wallstreetzen-{i}-{idx+1}.html"
            with open(filename, 'wb') as f:
                f.write(response.content)
            print(f"File downloaded: {filename}")
            time.sleep(2)

download_top_1000_companies_data()
