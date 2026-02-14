using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.BIMIRecordValidator
{
    /// <summary>
    /// Query options for the BIMI Record Validator API
    /// </summary>
    public class BIMIRecordValidatorQueryOptions
    {
        /// <summary>
        /// The domain to validate the BIMI record for
        /// </summary>
        [JsonProperty("domain")]
        public string Domain { get; set; }
    }
}
