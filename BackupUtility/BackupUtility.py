import base64
import requests 
import json

network_id =  ""
api_key = ""
auth_value = base64.b64encode(bytes(network_id + ":" + api_key, "utf-8")).decode()

headers = {"Authorization": "Basic " + auth_value}

result = requests.get("https://test.jamfcloud.com/api/devices", headers=headers)
devices = result.json()["devices"]

for device in devices:
    print(json.dumps(device, indent=2))