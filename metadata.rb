name             "apps-newrelic"
maintainer       "getaroom"
maintainer_email "devteam@roomvaluesteam.com"
license          "MIT"
description      "Configures New Relic for Apps"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "1.0.0"

depends "apps"

supports "debian"
supports "ubuntu"

recipe "apps-newrelic", "Configures New Relic for apps."
recipe "apps-newrelic::yaml", "Generates a newrelic.yml file."
