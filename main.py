import datetime
from google.cloud import storage

from src.collect_data import download_top_1000_companies_data
from src.parse_data import generate_json_from_html
from src.save_data import upload_to_gcs
