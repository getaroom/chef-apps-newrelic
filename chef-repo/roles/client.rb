name "client"
description "Tests for New Relic Client"

run_list(
  "recipe[users::sysadmins]",
  "recipe[apps]",
  "recipe[apps-newrelic::yaml]",
)

default_attributes({
  "minitest" => {
    "tests" => "apps-newrelic/*_test.rb",
  },
  "newrelic" => {
    "license_key" => "abcdefghijklmnopqrstuvwxyz1234567890"
  },
})
