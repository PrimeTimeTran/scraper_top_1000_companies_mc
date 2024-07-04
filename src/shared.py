import os

bucket_name = 'turboship-dev-alpha'
project_dir = '/Users/future/Documents/Work/_Main/.Projects/scraper_top_1000_companies_mc'

gcp_credentials_path = "/Users/future/.config/gcloud/application_default_credentials.json"
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = gcp_credentials_path

data_directory = f"{project_dir}/tmp/scraped_data"
summaries_directory = f"{project_dir}/tmp/parsed_summaries"

if not os.path.exists(data_directory):
    os.makedirs(data_directory)
