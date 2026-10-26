/// Response models for the BIMI Record Validator API.

/// API Response wrapper.
class BimivalidatorResponse {
  final String status;
  final dynamic error;
  final BimivalidatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  BimivalidatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory BimivalidatorResponse.fromJson(Map<String, dynamic> json) => BimivalidatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? BimivalidatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the BIMI Record Validator API.

class BimivalidatorData {
  String? host;
  String? bimiHost;
  bool? hasBimiRecord;
  String? bimiRecord;
  num? bimiRecordsCount;
  String? version;
  BimivalidatorDataSvgLogo? svgLogo;
  BimivalidatorDataVmcCertificate? vmcCertificate;
  List<dynamic>? issuesFound;
  bool? valid;

  BimivalidatorData({
    this.host,
    this.bimiHost,
    this.hasBimiRecord,
    this.bimiRecord,
    this.bimiRecordsCount,
    this.version,
    this.svgLogo,
    this.vmcCertificate,
    this.issuesFound,
    this.valid,
  });

  factory BimivalidatorData.fromJson(Map<String, dynamic> json) => BimivalidatorData(
      host: json['host'],
      bimiHost: json['bimi_host'],
      hasBimiRecord: json['has_bimi_record'],
      bimiRecord: json['bimi_record'],
      bimiRecordsCount: json['bimi_records_count'],
      version: json['version'],
      svgLogo: json['svg_logo'] != null ? BimivalidatorDataSvgLogo.fromJson(json['svg_logo']) : null,
      vmcCertificate: json['vmc_certificate'] != null ? BimivalidatorDataVmcCertificate.fromJson(json['vmc_certificate']) : null,
      issuesFound: (json['issues_found'] as List?)?.cast<dynamic>(),
      valid: json['valid'],
    );
}

class BimivalidatorDataSvgLogo {
  String? url;
  num? statusCode;
  bool? valid;
  num? fileSizeBytes;

  BimivalidatorDataSvgLogo({
    this.url,
    this.statusCode,
    this.valid,
    this.fileSizeBytes,
  });

  factory BimivalidatorDataSvgLogo.fromJson(Map<String, dynamic> json) => BimivalidatorDataSvgLogo(
      url: json['url'],
      statusCode: json['status_code'],
      valid: json['valid'],
      fileSizeBytes: json['file_size_bytes'],
    );
}

class BimivalidatorDataVmcCertificate {
  String? url;
  num? statusCode;
  bool? valid;

  BimivalidatorDataVmcCertificate({
    this.url,
    this.statusCode,
    this.valid,
  });

  factory BimivalidatorDataVmcCertificate.fromJson(Map<String, dynamic> json) => BimivalidatorDataVmcCertificate(
      url: json['url'],
      statusCode: json['status_code'],
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
