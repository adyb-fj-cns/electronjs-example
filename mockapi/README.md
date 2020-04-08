# Mock API

* https://www.mock-server.com/mock_server/running_mock_server.html
* https://www.mock-server.com/mock_server/configuration_properties.html
* https://www.mock-server.com/mock_server/creating_expectations.html

Example creating expectation with REST API
```
curl -v -X PUT "http://localhost:1080/mockserver/expectation" -d '{
  "httpRequest" : {
    "method" : "GET",
    "path" : "/goodbye"
  },
  "httpResponse" : {
    "body" : "Goodbye World!"
  }
}'
```

```
curl -v -X PUT "http://localhost:1080/mockserver/expectation" -d '{
    "httpRequest": {
        "path": "/some/path"
    },
    "httpResponseTemplate": {
        "template": "return { statusCode: 200, cookies: { session: request.headers[\"Session-Id\"] && request.headers[\"Session-Id\"][0] }, headers: { Date: [ Date() ] }, body: JSON.stringify({method: request.method, path: request.path, body: request.body}) };",
        "templateType": "JAVASCRIPT"
    }
}'
```

```
curl -v -X PUT "http://localhost:1080/mockserver/expectation" -d '{
    "httpRequest": {
        "path": "/some/path"
    },
    "httpResponseTemplate": {
        "template": "{ \"statusCode\": 200, \"cookies\": { \"session\": \"$!request.headers[\"Session-Id\"][0]\" }, \"headers\": { \"Client-User-Agent\": [ \"$!request.headers[\"User-Agent\"][0]\" ] }, \"body\": \"$!request.body\" }",
        "templateType": "VELOCITY"
    }
}'
```