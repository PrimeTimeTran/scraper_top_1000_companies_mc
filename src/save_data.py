import datetime
from google.cloud import storage

from shared import project_dir, bucket_name

def upload_to_gcs(bucket_name, local_file_path, destination_blob_name):
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)
    blob.upload_from_filename(local_file_path)

    print(f"File {local_file_path} uploaded to {destination_blob_name} in bucket {bucket_name}")

today = datetime.datetime.today().strftime('%Y-%m-%d')
local_file_path = f'{project_dir}/tmp/parsed_summaries/stocks-{today}.json'
destination_blob_name = f'{project_dir}/summaries/top-1000-companies/stocks-{today}.json'

upload_to_gcs(bucket_name, local_file_path, destination_blob_name)
