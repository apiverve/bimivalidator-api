declare module '@apiverve/bimivalidator' {
  export interface bimivalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface bimivalidatorResponse {
    status: string;
    error: string | null;
    data: BIMIRecordValidatorData;
    code?: number;
  }


  interface BIMIRecordValidatorData {
      bimiHost:         string;
      bimiRecord:       string;
      bimiRecordsCount: number;
      hasBimiRecord:    boolean;
      host:             string;
      svgLogo:          SVGLogo;
      valid:            boolean;
      version:          string;
      vmcCertificate:   SVGLogo;
  }
  
  interface SVGLogo {
      fileSizeBytes?: number;
      statusCode:     number;
      url:            string;
      valid:          boolean;
  }

  export default class bimivalidatorWrapper {
    constructor(options: bimivalidatorOptions);

    execute(callback: (error: any, data: bimivalidatorResponse | null) => void): Promise<bimivalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: bimivalidatorResponse | null) => void): Promise<bimivalidatorResponse>;
    execute(query?: Record<string, any>): Promise<bimivalidatorResponse>;
  }
}
