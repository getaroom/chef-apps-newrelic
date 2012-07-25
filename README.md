Configures New Relic for Apps

Tested on Ubuntu 12.04

# Recipes

## default

Configures New Relic for apps.

## yaml

Generates a newrelic.yml file.

# Example Data Bag Items

## Apps

```json
{
  "id": "www",
  "owner": "www",
  "group": "www",
  "deploy_to": "/srv/www",
  "server_roles": ["www"],
  "ingredients": {
    "www": ["newrelic.yml"]
  },
  "newrelic": {
    "_default": {
      "app_name": "WWW",
      "monitor_mode": true,
      "developer_mode": false,
      "log_level": "info",
      "ssl": false,
      "apdex_t": 0.5,
      "capture_params": false,
      "browser_monitoring": {
        "auto_instrument": true
      },
      "transaction_tracer": {
        "enabled": true,
        "transaction_threshold": "apdex_f",
        "record_sql": "obfuscated",
        "stack_trace_threshold": 0.500
      },
      "error_collector": {
        "enabled": true,
        "capture_source": true,
        "ignore_errors": "ActionController::RoutingError"
      }
    },
    "staging": {
      "app_name": "WWW (Staging)"
    }
  }
}
```

# License and Authors

* Chris Griego (<cgriego@getaroom.com>)

Copyright 2012, getaroom

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
