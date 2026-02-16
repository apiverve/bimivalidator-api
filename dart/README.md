# BIMI Record Validator API - Dart/Flutter Client

BIMI Validator checks if a domain has a valid BIMI record published in DNS. BIMI enables domain owners to display verified logos in supported email clients.

[![pub package](https://img.shields.io/pub/v/apiverve_bimivalidator.svg)](https://pub.dev/packages/apiverve_bimivalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [BIMI Record Validator API](https://apiverve.com/marketplace/bimivalidator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_bimivalidator: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_bimivalidator/apiverve_bimivalidator.dart';

void main() async {
  final client = BimivalidatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'domain': 'ebay.com'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "bimi_host": "default._bimi.ebay.com",
    "bimi_record": "v=BIMI1;l=https://bimi.entrust.net/ebay.com/logo.svg;a=https://bimi.entrust.net/ebay.com/certchain.pem",
    "bimi_records_count": 1,
    "has_bimi_record": true,
    "host": "ebay.com",
    "svg_logo": {
      "file_size_bytes": 1633,
      "status_code": 200,
      "url": "https://bimi.entrust.net/ebay.com/logo.svg",
      "valid": true
    },
    "valid": true,
    "version": "BIMI1",
    "vmc_certificate": {
      "status_code": 200,
      "url": "https://bimi.entrust.net/ebay.com/certchain.pem",
      "valid": true
    }
  }
}
```

## API Reference

- **API Home:** [BIMI Record Validator API](https://apiverve.com/marketplace/bimivalidator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/bimivalidator](https://docs.apiverve.com/ref/bimivalidator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
