#!/bin/bash

source /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/.venv/bin/activate

/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/.venv/bin/python -m pip install --upgrade pip
/Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/.venv/bin/python -m pip install -r /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/requirements.txt

/opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/collect_data.py

sleep 300
/opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/parse_data.py

sleep 60
GCP_CREDENTIALS="/Users/future/.config/gcloud/application_default_credentials.json"
export GOOGLE_APPLICATION_CREDENTIALS="$GCP_CREDENTIALS"
/opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/top_1000_companies_scraper/src/save_data.py
