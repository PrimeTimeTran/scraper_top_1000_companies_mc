#!/bin/bash

source /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/.venv/bin/activate

# Install dependencies
/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/.venv/bin/python -m pip install --upgrade pip
/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/.venv/bin/python -m pip install -r /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/requirements.txt

/opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/collect_data.py
sleep 600  # Wait for 10 minutes
/opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/parse_data.py
sleep 60  # Wait for another 5 minutes
/opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/save_data.py
