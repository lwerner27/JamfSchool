import http.client
import json
import base64

# A function that creates the value required for the Authorization header
def create_auth_value(input_string):
    
    # Ensure the string is a bytes-like object
    bytes_string = input_string.encode('utf-8')

    # Encode the bytes-like object into base64
    base64_bytes = base64.b64encode(bytes_string)

    # Convert base64 bytes to string
    base64_string = base64_bytes.decode('utf-8')

    return "Basic " + base64_string

# The base URL you are trying to make reqeusts to
baseUrl = "example.jamfcloud.com"

# The endpoint for the request
req_endpoint = "/api/devices"

# Creates a connection to the server
conn = http.client.HTTPSConnection(baseUrl)

# Set headers needed for the request
headers = { 'Authorization': create_auth_value("NETWORK_ID:API_KEY") }

# Make the request to the server
conn.request("GET", req_endpoint, headers=headers)

# Get the response from the server after the request has been made
response = conn.getresponse()

# For checking the status of the request
print(response.status) 

# Reads and decodes the data from the response 
data = json.loads(response.read().decode()) 

# Print the JSON with nice formatting
print(json.dumps(data, indent=4))

# TODO: Update the this script so that it can ingest a CSV and make the required requests to update device information
# Many schools have trouble moving devices and user between Jamf School locations at the end of the school year. 
# The goal of this script will be to help alleviate that sceneario using the API. 