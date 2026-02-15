/// Response models for the BIMI Record Validator API.

/// API Response wrapper.
class BimivalidatorResponse {
  final String status;
  final dynamic error;
  final BimivalidatorData? data;

  BimivalidatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory BimivalidatorResponse.fromJson(Map<String, dynamic> json) => BimivalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? BimivalidatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the BIMI Record Validator API.

class BimivalidatorData {
  String? bimiHost;
  String? bimiRecord;
  int? bimiRecordsCount;
  bool? hasBimiRecord;
  String? host;
  BimivalidatorDataSvgLogo? svgLogo;
  bool? valid;
  String? version;
  BimivalidatorDataVmcCertificate? vmcCertificate;

  BimivalidatorData({
    this.bimiHost,
    this.bimiRecord,
    this.bimiRecordsCount,
    this.hasBimiRecord,
    this.host,
    this.svgLogo,
    this.valid,
    this.version,
    this.vmcCertificate,
  });

  factory BimivalidatorData.fromJson(Map<String, dynamic> json) => BimivalidatorData(
      bimiHost: json['bimi_host'],
      bimiRecord: json['bimi_record'],
      bimiRecordsCount: json['bimi_records_count'],
      hasBimiRecord: json['has_bimi_record'],
      host: json['host'],
      svgLogo: json['svg_logo'] != null ? BimivalidatorDataSvgLogo.fromJson(json['svg_logo']) : null,
      valid: json['valid'],
      version: json['version'],
      vmcCertificate: json['vmc_certificate'] != null ? BimivalidatorDataVmcCertificate.fromJson(json['vmc_certificate']) : null,
    );
}

class BimivalidatorDataSvgLogo {
  int? fileSizeBytes;
  int? statusCode;
  String? url;
  bool? valid;

  BimivalidatorDataSvgLogo({
    this.fileSizeBytes,
    this.statusCode,
    this.url,
    this.valid,
  });

  factory BimivalidatorDataSvgLogo.fromJson(Map<String, dynamic> json) => BimivalidatorDataSvgLogo(
      fileSizeBytes: json['file_size_bytes'],
      statusCode: json['status_code'],
      url: json['url'],
      valid: json['valid'],
    );
}

class BimivalidatorDataVmcCertificate {
  int? statusCode;
  String? url;
  bool? valid;

  BimivalidatorDataVmcCertificate({
    this.statusCode,
    this.url,
    this.valid,
  });

  factory BimivalidatorDataVmcCertificate.fromJson(Map<String, dynamic> json) => BimivalidatorDataVmcCertificate(
      statusCode: json['status_code'],
      url: json['url'],
      valid: json['valid'],
    );
}

class BimivalidatorRequest {
  String domain;

  BimivalidatorRequest({
    required this.domain,
  });

  Map<String, dynamic> toJson() => {
      'domain': domain,
    };
}
