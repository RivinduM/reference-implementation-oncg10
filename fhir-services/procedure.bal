// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

//
// AUTO-GENERATED FILE.
//
// This file is auto-generated by Ballerina.
// Developers are allowed to modify this file as per the requirement.

import ballerina/http;
import ballerina/time;
import ballerinax/health.fhir.r4;
import ballerinax/health.fhirr4;
import ballerinax/health.fhir.r4.uscore700;

# Generic type to wrap all implemented profiles.
# Add required profile types here.
# public type Procedure r4:Procedure|<other_Procedure_Profile>;
public type Procedure uscore700:USCoreProcedureProfile;

# A service representing a network-accessible API
# bound to port `9101`.
service /fhir/r4 on new fhirr4:Listener(9101, procedureApiConfig) {

    // Read the current state of single resource based on its id.
    isolated resource function get Procedure/[string id](r4:FHIRContext fhirContext) returns Procedure|r4:OperationOutcome|r4:FHIRError|error {
        lock {
            json[] data = check retrieveData("Procedure").ensureType();
            foreach json val in data {
                map<json> fhirResource = check val.ensureType();
                if (fhirResource.resourceType == "Procedure" && fhirResource.id == id) {
                    Procedure procedure = check fhirResource.cloneWithType(Procedure);
                    return procedure.clone();
                }
            }
        }
        return r4:createFHIRError("Not found", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_FOUND);
    }

    // Read the state of a specific version of a resource based on its id.
    isolated resource function get Procedure/[string id]/_history/[string vid](r4:FHIRContext fhirContext) returns Procedure|r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // Search for resources based on a set of criteria.
    isolated resource function get Procedure(r4:FHIRContext fhirContext) returns r4:Bundle|r4:OperationOutcome|r4:FHIRError|error {
        return filterProcedureData(fhirContext);
    }

    // Create a new resource.
    isolated resource function post Procedure(r4:FHIRContext fhirContext, Procedure procedure) returns Procedure|r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // Update the current state of a resource completely.
    isolated resource function put Procedure/[string id](r4:FHIRContext fhirContext, Procedure procedure) returns Procedure|r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // Update the current state of a resource partially.
    isolated resource function patch Procedure/[string id](r4:FHIRContext fhirContext, json patch) returns Procedure|r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // Delete a resource.
    isolated resource function delete Procedure/[string id](r4:FHIRContext fhirContext) returns r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // Retrieve the update history for a particular resource.
    isolated resource function get Procedure/[string id]/_history(r4:FHIRContext fhirContext) returns r4:Bundle|r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // Retrieve the update history for all resources.
    isolated resource function get Procedure/_history(r4:FHIRContext fhirContext) returns r4:Bundle|r4:OperationOutcome|r4:FHIRError {
        return r4:createFHIRError("Not implemented", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_NOT_IMPLEMENTED);
    }

    // post search request
    isolated resource function post Procedure/_search(r4:FHIRContext fhirContext) returns r4:FHIRError|http:Response {
        r4:Bundle|error result = filterProcedureData(fhirContext);
        if result is r4:Bundle {
            http:Response response = new;
            response.statusCode = http:STATUS_OK;
            response.setPayload(result.clone().toJson());
            return response;
        } else {
            return r4:createFHIRError("Internal Server Error", r4:ERROR, r4:INFORMATIONAL, httpStatusCode = http:STATUS_INTERNAL_SERVER_ERROR);
        }
    }
}

isolated function filterProcedureData(r4:FHIRContext fhirContext) returns r4:FHIRError|r4:Bundle|error {
    boolean isSearchParamAvailable = false;
    r4:TokenSearchParameter[] statusParam = check fhirContext.getTokenSearchParameter("status") ?: [];
    string[] statuses = [];
    foreach r4:TokenSearchParameter item in statusParam {
        string id = check item.code.ensureType();
        statuses.push(id);
    }
    r4:TokenSearchParameter[] codeParam = check fhirContext.getTokenSearchParameter("code") ?: [];
    string[] codes = [];
    foreach r4:TokenSearchParameter item in codeParam {
        string id = check item.code.ensureType();
        codes.push(id);
    }
    r4:ReferenceSearchParameter[] patientParam = check fhirContext.getReferenceSearchParameter("patient") ?: [];
    string[] patients = [];
    foreach r4:ReferenceSearchParameter item in patientParam {
        string id = check item.id.ensureType();
        patients.push("Patient/" + id);
    }
    r4:DateSearchParameter[] dateParam = check fhirContext.getDateSearchParameter("date") ?: [];
    time:Utc[] dates = [];
    foreach r4:DateSearchParameter item in dateParam {
        time:Civil date = check item.value.ensureType();
        dates.push(check time:utcFromCivil(date));
    }
    r4:TokenSearchParameter[] revIncludeParam = check fhirContext.getTokenSearchParameter("_revinclude") ?: [];
    string revInclude = revIncludeParam != [] ? check revIncludeParam[0].code.ensureType() : "";
    lock {

        r4:Bundle bundle = {identifier: {system: ""}, 'type: "searchset", entry: []};
        r4:BundleEntry bundleEntry = {};
        int count = 0;
        json[] data = check retrieveData("Procedure").ensureType();
        json[] resultSet = data;

        // filter by patient
        if (patients.length() > 0) {
            resultSet = [];
            isSearchParamAvailable = true;
            foreach json val in data {
                map<json> fhirResource = check val.ensureType();
                if fhirResource.hasKey("subject") {
                    map<json> patient = check fhirResource.subject.ensureType();
                    if patient.hasKey("reference") {
                        string patientRef = check patient.reference.ensureType();
                        if (patients.indexOf(patientRef) > -1) {
                            resultSet.push(fhirResource);
                            continue;
                        }
                    }
                }
            }
        }

        // filter by date
        json[] dateFilteredData = [];
        if (dates.length() > 0) {
            isSearchParamAvailable = true;
            foreach json val in resultSet {
                map<json> fhirResource = check val.ensureType();
                if fhirResource.hasKey("performedDateTime") {
                    string dateTime = check fhirResource.performedDateTime.ensureType();
                    dateTime = dateTime.includes("T") ? dateTime : dateTime + "T00:00:00Z";
                    if (dates.indexOf(check time:utcFromString(dateTime)) > -1) {
                        dateFilteredData.push(fhirResource);
                        continue;
                    }
                }
            }
            resultSet = dateFilteredData;
        }

        // filter by status
        json[] statusFilteredData = [];
        if (statuses.length() > 0) {
            isSearchParamAvailable = true;
            foreach json val in resultSet {
                map<json> fhirResource = check val.ensureType();
                if fhirResource.hasKey("status") {
                    string status = check fhirResource.status.ensureType();

                    if (statuses.indexOf(status) > -1) {
                        statusFilteredData.push(fhirResource);
                        continue;
                    }

                }
            }
            resultSet = statusFilteredData;
        }

        // filter by code
        json[] codeFilteredData = [];
        if (codes.length() > 0) {
            isSearchParamAvailable = true;
            foreach json val in resultSet {
                map<json> fhirResource = check val.ensureType();
                if fhirResource.hasKey("code") {
                    map<json> codeElement = check fhirResource.code.ensureType();
                    if codeElement.hasKey("coding") {
                        json[] coding = check codeElement.coding.ensureType();
                        foreach json codingItem in coding {
                            map<json> codingResource = check codingItem.ensureType();
                            if codingResource.hasKey("code") {
                                string code = check codingResource.code.ensureType();
                                if (codes.indexOf(code) > -1) {
                                    codeFilteredData.push(fhirResource);
                                    continue;
                                }
                            }
                        }
                    }
                }
            }
            resultSet = codeFilteredData;
        }

        resultSet = isSearchParamAvailable ? resultSet : data;
        foreach json item in resultSet {
            bundleEntry = {fullUrl: "", 'resource: item};
            bundle.entry[count] = bundleEntry;
            count += 1;
        }

        if bundle.entry != [] {
            return addRevInclude(revInclude, bundle, count, "Procedure").clone();
        }
        return bundle.clone();
    }

}
