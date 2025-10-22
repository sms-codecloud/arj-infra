import boto3
from botocore.exceptions import ClientError

def manage_s3_bucket(action, bucket_name, region='ap-south-1'):
    s3_client = boto3.client('s3', region_name=region)

    try:
        if action.lower() == "create":
            if region == "us-east-1":
                s3_client.create_bucket(Bucket=bucket_name)
            else:
                s3_client.create_bucket(
                    Bucket=bucket_name,
                    CreateBucketConfiguration={'LocationConstraint': region}
                )
            print(f"Bucket '{bucket_name}' created successfully in region {region}.")

        elif action.lower() == "delete":
            # Remove all objects before deleting
            print(f"Deleting all objects in bucket '{bucket_name}'...")
            s3 = boto3.resource('s3')
            bucket = s3.Bucket(bucket_name)
            bucket.objects.all().delete()
            
            # Delete the bucket
            s3_client.delete_bucket(Bucket=bucket_name)
            print(f"Bucket '{bucket_name}' deleted successfully.")

        else:
            print("Invalid action. Use 'create' or 'delete'.")

    except ClientError as e:
        print(f"AWS Error: {e}")

# ======== Example Usage ========
if __name__ == "__main__":
    # Change this line as needed:
    manage_s3_bucket(action="create", bucket_name="arj-bucket-via-python", region="ap-south-1")

    # To delete instead:
    # manage_s3_bucket(action="delete", bucket_name="arj-bucket-via-python", region="ap-south-1")
