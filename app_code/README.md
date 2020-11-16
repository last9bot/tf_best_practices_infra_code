# tf_best_practices_app_code

Terraform best practices post app code

## Package and upload your lambda to S3

1. Install and activate virtualenv

    ```sh
    pip install virtualenv
    python -m virtualenv venv
    source ./venv/bin/activate
    ```

2. Ensure that state bucket is created

    ```sh
    ./create-bucket.sh
    ```

3. Package the lambda - poor man's CI

    ```sh
    ./package.sh lambda.py
    ```

4. Upload the lambda to the pre-created S3 bucket

    ```sh
    ./upload.sh
    ```

5. Delete the bucket when done with testing

    ```sh
    ./delete-bucket.sh
    ```
