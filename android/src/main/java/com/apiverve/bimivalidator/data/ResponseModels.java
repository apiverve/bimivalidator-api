// Converter.java

// To use this code, add the following Maven dependency to your project:
//
//
//     com.fasterxml.jackson.core     : jackson-databind          : 2.9.0
//     com.fasterxml.jackson.datatype : jackson-datatype-jsr310   : 2.9.0
//
// Import this package:
//
//     import com.apiverve.data.Converter;
//
// Then you can deserialize a JSON string with
//
//     BIMIRecordValidatorData data = Converter.fromJsonString(jsonString);

package com.apiverve.bimivalidator.data;

import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import java.util.*;
import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.time.OffsetTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class Converter {
    // Date-time helpers

    private static final DateTimeFormatter DATE_TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_DATE_TIME)
            .appendOptional(DateTimeFormatter.ISO_INSTANT)
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ssX"))
            .appendOptional(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetDateTime parseDateTimeString(String str) {
        return ZonedDateTime.from(Converter.DATE_TIME_FORMATTER.parse(str)).toOffsetDateTime();
    }

    private static final DateTimeFormatter TIME_FORMATTER = new DateTimeFormatterBuilder()
            .appendOptional(DateTimeFormatter.ISO_TIME)
            .appendOptional(DateTimeFormatter.ISO_OFFSET_TIME)
            .parseDefaulting(ChronoField.YEAR, 2020)
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter()
            .withZone(ZoneOffset.UTC);

    public static OffsetTime parseTimeString(String str) {
        return ZonedDateTime.from(Converter.TIME_FORMATTER.parse(str)).toOffsetDateTime().toOffsetTime();
    }
    // Serialize/deserialize helpers

    public static BIMIRecordValidatorData fromJsonString(String json) throws IOException {
        return getObjectReader().readValue(json);
    }

    public static String toJsonString(BIMIRecordValidatorData obj) throws JsonProcessingException {
        return getObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader reader;
    private static ObjectWriter writer;

    private static void instantiateMapper() {
        ObjectMapper mapper = new ObjectMapper();
        mapper.findAndRegisterModules();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        SimpleModule module = new SimpleModule();
        module.addDeserializer(OffsetDateTime.class, new JsonDeserializer<OffsetDateTime>() {
            @Override
            public OffsetDateTime deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
                String value = jsonParser.getText();
                return Converter.parseDateTimeString(value);
            }
        });
        mapper.registerModule(module);
        reader = mapper.readerFor(BIMIRecordValidatorData.class);
        writer = mapper.writerFor(BIMIRecordValidatorData.class);
    }

    private static ObjectReader getObjectReader() {
        if (reader == null) instantiateMapper();
        return reader;
    }

    private static ObjectWriter getObjectWriter() {
        if (writer == null) instantiateMapper();
        return writer;
    }
}

// BIMIRecordValidatorData.java

package com.apiverve.bimivalidator.data;

import com.fasterxml.jackson.annotation.*;

public class BIMIRecordValidatorData {
    private String bimiHost;
    private String bimiRecord;
    private long bimiRecordsCount;
    private boolean hasBimiRecord;
    private String host;
    private SVGLogo svgLogo;
    private boolean valid;
    private String version;
    private SVGLogo vmcCertificate;

    @JsonProperty("bimi_host")
    public String getBimiHost() { return bimiHost; }
    @JsonProperty("bimi_host")
    public void setBimiHost(String value) { this.bimiHost = value; }

    @JsonProperty("bimi_record")
    public String getBimiRecord() { return bimiRecord; }
    @JsonProperty("bimi_record")
    public void setBimiRecord(String value) { this.bimiRecord = value; }

    @JsonProperty("bimi_records_count")
    public long getBimiRecordsCount() { return bimiRecordsCount; }
    @JsonProperty("bimi_records_count")
    public void setBimiRecordsCount(long value) { this.bimiRecordsCount = value; }

    @JsonProperty("has_bimi_record")
    public boolean getHasBimiRecord() { return hasBimiRecord; }
    @JsonProperty("has_bimi_record")
    public void setHasBimiRecord(boolean value) { this.hasBimiRecord = value; }

    @JsonProperty("host")
    public String getHost() { return host; }
    @JsonProperty("host")
    public void setHost(String value) { this.host = value; }

    @JsonProperty("svg_logo")
    public SVGLogo getSVGLogo() { return svgLogo; }
    @JsonProperty("svg_logo")
    public void setSVGLogo(SVGLogo value) { this.svgLogo = value; }

    @JsonProperty("valid")
    public boolean getValid() { return valid; }
    @JsonProperty("valid")
    public void setValid(boolean value) { this.valid = value; }

    @JsonProperty("version")
    public String getVersion() { return version; }
    @JsonProperty("version")
    public void setVersion(String value) { this.version = value; }

    @JsonProperty("vmc_certificate")
    public SVGLogo getVmcCertificate() { return vmcCertificate; }
    @JsonProperty("vmc_certificate")
    public void setVmcCertificate(SVGLogo value) { this.vmcCertificate = value; }
}

// SVGLogo.java

package com.apiverve.bimivalidator.data;

import com.fasterxml.jackson.annotation.*;

public class SVGLogo {
    private Long fileSizeBytes;
    private long statusCode;
    private String url;
    private boolean valid;

    @JsonProperty("file_size_bytes")
    public Long getFileSizeBytes() { return fileSizeBytes; }
    @JsonProperty("file_size_bytes")
    public void setFileSizeBytes(Long value) { this.fileSizeBytes = value; }

    @JsonProperty("status_code")
    public long getStatusCode() { return statusCode; }
    @JsonProperty("status_code")
    public void setStatusCode(long value) { this.statusCode = value; }

    @JsonProperty("url")
    public String getURL() { return url; }
    @JsonProperty("url")
    public void setURL(String value) { this.url = value; }

    @JsonProperty("valid")
    public boolean getValid() { return valid; }
    @JsonProperty("valid")
    public void setValid(boolean value) { this.valid = value; }
}