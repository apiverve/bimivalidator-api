# BIMI Record Validator API - Ruby Gem

BIMI Validator checks if a domain has a valid BIMI record published in DNS. BIMI enables domain owners to display verified logos in supported email clients.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_bimivalidator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_bimivalidator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_bimivalidator'

# Initialize the client
client = APIVerve::Bimivalidator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ domain: "ebay.com" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ domain: "ebay.com" })
  puts response["data"]
rescue APIVerve::Bimivalidator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Bimivalidator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Bimivalidator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/bimivalidator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/bimivalidator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/bimivalidator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
