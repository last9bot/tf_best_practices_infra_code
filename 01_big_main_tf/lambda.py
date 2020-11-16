import json


def lambda_handler(event, context):
    food_times = {
        "/breakfast": {"time": "9 AM", "menu": ["poha", "chai"]},
        "/brunch": {"time": "12 PM", "menu": ["fancy stuff"]},
        "/lunch": {"time": "1:30 PM", "menu": ["rajma", "chawal"]},
        "/supper": {"time": "5:30 PM", "menu": ["pakoday", "chai"]},
        "/dinner": {"time": "8 PM", "menu": ["besan chilla", "chutney"]},
    }

    result = food_times.get(event["path"], "not_found")

    status_code = 200
    if result == "not_found":
        status_code = 404

    response = {"body": json.dumps({event["path"]: result}), "statusCode": str(status_code)}
    print(json.dumps(response, indent=2, default=str))
    return response


if __name__ == "__main__":
    output = lambda_handler(None, None)
    print(output["body"])
