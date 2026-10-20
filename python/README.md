BIMI Record Validator API
============

BIMI Validator checks if a domain has a valid BIMI record published in DNS. BIMI enables domain owners to display verified logos in supported email clients.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-bimirecordvalidator.svg)](https://pypi.org/project/apiverve-bimirecordvalidator/)

This is a Python wrapper for the [BIMI Record Validator API](https://apiverve.com/marketplace/bimivalidator?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-bimirecordvalidator
```

Using `pip3`:

```bash
pip3 install apiverve-bimirecordvalidator
```

---

## Configuration

Before using the BIMI Record Validator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient

# Initialize the client with your APIVerve API key
api = BimivalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "ebay.com" }

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The BIMI Record Validator API documentation is found here: [https://docs.apiverve.com/ref/bimivalidator](https://docs.apiverve.com/ref/bimivalidator?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient

# Initialize the client with your APIVerve API key
api = BimivalidatorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = { "domain": "ebay.com" }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "host": "ebay.com",
    "bimi_host": "default._bimi.ebay.com",
    "has_bimi_record": true,
    "bimi_record": "v=BIMI1;l=https://vmc.digicert.com/2b7216dc-27d2-4fbd-8472-f68790117238.svg;a=https://vmc.digicert.com/2b7216dc-27d2-4fbd-8472-f68790117238.pem",
    "bimi_records_count": 1,
    "version": "BIMI1",
    "svg_logo": {
      "url": "https://vmc.digicert.com/2b7216dc-27d2-4fbd-8472-f68790117238.svg",
      "status_code": 200,
      "valid": true,
      "file_size_bytes": 1518
    },
    "vmc_certificate": {
      "url": "https://vmc.digicert.com/2b7216dc-27d2-4fbd-8472-f68790117238.pem",
      "status_code": 200,
      "valid": true
    },
    "issues_found": [],
    "valid": true
  }
}
```

---

## Error Handling

The API client provides comprehensive error handling through the `BimivalidatorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient, BimivalidatorAPIClientError

api = BimivalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "ebay.com" }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except BimivalidatorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient, BimivalidatorAPIClientError

api = BimivalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "ebay.com" }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except BimivalidatorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient, BimivalidatorAPIClientError

query = { "domain": "ebay.com" }

# Using context manager ensures proper cleanup
with BimivalidatorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except BimivalidatorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient

# Enable debug mode
api = BimivalidatorAPIClient("[YOUR_API_KEY]", debug=True)

query = { "domain": "ebay.com" }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_bimirecordvalidator.apiClient import BimivalidatorAPIClient

api = BimivalidatorAPIClient("[YOUR_API_KEY]")

query = { "domain": "ebay.com" }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
