# BIMI Record Validator API - PHP Package

BIMI Validator checks if a domain has a valid BIMI record published in DNS. BIMI enables domain owners to display verified logos in supported email clients.

## Installation

Install via Composer:

```bash
composer require apiverve/bimivalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Bimivalidator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['domain' => 'ebay.com']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Bimivalidator\Client;
use APIVerve\Bimivalidator\Exceptions\APIException;
use APIVerve\Bimivalidator\Exceptions\ValidationException;

try {
    $response = $client->execute(['domain' => 'ebay.com']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/bimivalidator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/bimivalidator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/bimivalidator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
