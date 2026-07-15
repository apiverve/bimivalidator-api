declare module '@apiverve/bimivalidator' {
  export interface bimivalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface bimivalidatorResponse {
    status: string;
    error: string | null;
    data: BIMIRecordValidatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface BIMIRecordValidatorData {
      host:             null | string;
      bimiHost:         null | string;
      hasBimiRecord:    boolean | null;
      bimiRecord:       null | string;
      bimiRecordsCount: number | null;
      version:          null | string;
      svgLogo:          SVGLogo;
      vmcCertificate:   SVGLogo;
      issuesFound:      any[];
      valid:            boolean | null;
  }
  
  interface SVGLogo {
      url:            null | string;
      statusCode:     number | null;
      valid:          boolean | null;
      fileSizeBytes?: number | null;
  }

  export default class bimivalidatorWrapper {
    constructor(options: bimivalidatorOptions);

    execute(callback: (error: any, data: bimivalidatorResponse | null) => void): Promise<bimivalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: bimivalidatorResponse | null) => void): Promise<bimivalidatorResponse>;
    execute(query?: Record<string, any>): Promise<bimivalidatorResponse>;
  }
}
