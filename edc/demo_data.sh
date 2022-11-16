
echo "--------------------------------------------"
echo "Create Policies"
echo "--------------------------------------------"

policyId=$(curl --location --request POST 'http://localhost:8182/api/v1/data/policydefinitions' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "policy": {
        "id": "gaiax-4plc-aad-intern-use",
        "assignee": "n/a",
        "assigner": "Technische Universität Berlin",
        "permissions": [
                {
                "edctype": "dataspaceconnector:permission",
                "uid": null,
                "target": null,
                "action": {
                    "type": "USE",
                    "includedIn": null,
                    "constraint": null
                },
                "assignee": "n/a",
                "assigner": "Technische Universität Berlin Fachbereich ISE",
                "constraints": [],
                "duties": []
                }
            ],
        "prohibitions": [],
        "obligations": [],
        "extensibleProperties": {},
        "inheritsFrom": null,
        "target": "target",
        "@type": {
            "@policytype": "set"
        }
    }
}' | jq -r .id)

sleep 5s

echo "--------------------------------------------"
echo "Create Assets"
echo "--------------------------------------------"

curl --location --request POST 'http://localhost:8182/api/v1/data/assets' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "asset": {
        "properties": {
            "asset:prop:id": "002_GrafingMarktplatz",
            "asset:prop:name": "OpenDrive HD Map - Grafing Marktplatz",
            "asset:prop:description" : "Demonstration of OpenDrive format HD Map for Grafing Marktplatz",
            "asset:prop:version" : "1.0",
            "asset:prop:contenttype" : "OpenDrive Map"
        }
    },
    "dataAddress": {
        "properties": {
            "type": "File",
            "path": "https://github.com/GAIA-X4PLC-AAD/mapdata-3dms/blob/main/002_GrafingMarktplatz/ODR/Data",
            "filename" : "2022-10-19_1500_GAIA-X_Grafing_Marktplatz_v1.6_offset.xodr",
            "authKey" : "x-api-key",
            "authCode" : "password"
        }
    }
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/assets' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "asset": {
        "properties": {
            "asset:prop:id": "001_GrafingMarktplatz",
            "asset:prop:name": "TrianGraphics Data - Grafing Marktplatz",
            "asset:prop:description" : "Demonstration of OpenDrive format HD Map for Grafing Marktplatz",
            "asset:prop:version" : "1.0",
            "asset:prop:contenttype" : "OpenDrive Map"
        }
    },
    "dataAddress": {
        "properties": {
            "type": "File",
            "path": "https://github.com/GAIA-X4PLC-AAD/mapdata-TG/tree/main/001_GrafingMarktplatz/Unity",
            "filename" : "Readme.md",
            "authKey" : "x-api-key",
            "authCode" : "password"
        }
    }
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/assets' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "asset": {
        "properties": {
            "asset:prop:id": "001_A9_MinimumSample",
            "asset:prop:name": "OpenDrive HD Map - A9 Minimum Sample",
            "asset:prop:description" : "Demonstration of OpenDrive format HD Map for A9 Minimum Sample",
            "asset:prop:version" : "1.0",
            "asset:prop:contenttype" : "OpenDrive Map"
        }
    },
    "dataAddress": {
        "properties": {
            "type": "File",
            "path": "https://github.com/GAIA-X4PLC-AAD/mapdata-3dms/blob/main/001_A9_MinimumSample/ODR/Data/",
            "filename" : "2022-07-14_HD20_504_Highway_A9_Garching_ODR16_offset.xodr",
            "authKey" : "x-api-key",
            "authCode" : "password"
        }
    }
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/assets' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "asset": {
        "properties": {
            "asset:prop:id": "XODR-TGG-19002",
            "asset:prop:name": "Berlin Kudamm (XODR)",
            "asset:prop:description" : "The Kurfürstendamm, one of the most famous avenues in Berlin This very broad, long boulevard can be considered the Champs-Élysées …",
            "asset:prop:version" : "1.0",
            "asset:prop:contenttype" : "OpenDrive"
        }
    },
    "dataAddress": {
        "properties": {
            "type": "File",
            "path": "https://www.envited.market/en/product",
            "filename" : "?type=1",
            "authKey" : "x-api-key",
            "authCode" : "password"
        }
    }
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/assets' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "asset": {
        "properties": {
            "asset:prop:id": "XODR-TGG-19001",
            "asset:prop:name": "Wangen Village Route (XODR)",
            "asset:prop:description" : "A small (partly fictional) village circuit through Wangen im Allgäu, good to very good road conditions with mostly single-lane roads.",
            "asset:prop:version" : "1.0",
            "asset:prop:contenttype" : "OpenDrive"
        }
    },
    "dataAddress": {
        "properties": {
            "type": "File",
            "path": "https://www.envited.market/en/product",
            "filename" : "?type=1",
            "authKey" : "x-api-key",
            "authCode" : "password"
        }
    }
}'

sleep 5s

echo "--------------------------------------------"
echo "Create Contracts with polcy id ${policyId}"
echo "--------------------------------------------"



curl --location --request POST 'http://localhost:8182/api/v1/data/contractdefinitions' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "accessPolicyId": "'"${policyId}"'",
    "contractPolicyId": "'"${policyId}"'",
    "criteria": [
        {
            "operandLeft": "asset:prop:id",
            "operator": "=",
            "operandRight": "001_GrafingMarktplatz"
        }
    ],
    "id": "1337"
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/contractdefinitions' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "accessPolicyId": "'"${policyId}"'",
    "contractPolicyId": "'"${policyId}"'",
    "criteria": [
        {
            "operandLeft": "asset:prop:id",
            "operator": "=",
            "operandRight": "002_GrafingMarktplatz"
        }
    ],
    "id": "1338"
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/contractdefinitions' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "accessPolicyId": "'"${policyId}"'",
    "contractPolicyId": "'"${policyId}"'",
    "criteria": [
        {
            "operandLeft": "asset:prop:id",
            "operator": "=",
            "operandRight": "001_A9_MinimumSample"
        }
    ],
    "id": "1339"
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/contractdefinitions' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "accessPolicyId": "'"${policyId}"'",
    "contractPolicyId": "'"${policyId}"'",
    "criteria": [
        {
            "operandLeft": "asset:prop:id",
            "operator": "=",
            "operandRight": "XODR-TGG-19002"
        }
    ],
    "id": "1340"
}'

sleep 5s

curl --location --request POST 'http://localhost:8182/api/v1/data/contractdefinitions' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--header 'x-api-key: password' \
--data-raw '{
    "accessPolicyId": "'"${policyId}"'",
    "contractPolicyId": "'"${policyId}"'",
    "criteria": [
        {
            "operandLeft": "asset:prop:id",
            "operator": "=",
            "operandRight": "XODR-TGG-19001"
        }
    ],
    "id": "1341"
}'