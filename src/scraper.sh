#!/bin/bash

/opt/anaconda3/bin/python /Users/future/Documents/Work/\_Main/.Projects/price_scraper/src/collect_data.py
sleep 600  # Wait for 10 minutes
/opt/anaconda3/bin/python /Users/future/Documents/Work/\_Main/.Projects/price_scraper/src/parse_data.py
sleep 60  # Wait for another 5 minutes
/opt/anaconda3/bin/python /Users/future/Documents/Work/\_Main/.Projects/price_scraper/src/save_data.py