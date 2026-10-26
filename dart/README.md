# BIMI Record Validator API - Dart/Flutter Client

BIMI Validator checks if a domain has a valid BIMI record published in DNS. BIMI enables domain owners to display verified logos in supported email clients.

[![pub package](https://img.shields.io/pub/v/apiverve_bimivalidator.svg)](https://pub.dev/packages/apiverve_bimivalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [BIMI Record Validator API](https://apiverve.com/marketplace/bimivalidator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_bimivalidator: ^1.2.3
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

## API Reference

- **API Home:** [BIMI Record Validator API](https://apiverve.com/marketplace/bimivalidator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/bimivalidator](https://docs.apiverve.com/ref/bimivalidator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
