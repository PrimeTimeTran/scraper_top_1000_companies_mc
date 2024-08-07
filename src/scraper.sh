#!/bin/bash

source /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/.venv/bin/activate
{
    echo "========== Starting pip upgrade and requirements installation at $(date) =========="
    /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/.venv/bin/python -m pip install --upgrade pip
    /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/.venv/bin/python -m pip install -r /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/requirements.txt
    echo "========== Finished pip upgrade and requirements installation at $(date) =========="
} >> /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/tmp/logs/daily.log 2>&1

{
    echo "========== Starting collect_data.py at $(date) =========="
    /opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/src/collect_data.py
    echo "========== Finished collect_data.py at $(date) =========="
} >> /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/tmp/logs/daily.log 2>&1

sleep 300

{
    echo "========== Starting parse_data.py at $(date) =========="
    /opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/src/parse_data.py
    echo "========== Finished parse_data.py at $(date) =========="
} >> /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/tmp/logs/daily.log 2>&1

sleep 60
{
    echo "========== Starting save_data.py at $(date) =========="
    GCP_CREDENTIALS="/Users/future/.config/gcloud/application_default_credentials.json"
    export GOOGLE_APPLICATION_CREDENTIALS="$GCP_CREDENTIALS"
    /opt/anaconda3/bin/python /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/src/save_data.py
    echo "========== Finished save_data.py at $(date) =========="
} >> /Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc/tmp/logs/daily.log 2>&1
