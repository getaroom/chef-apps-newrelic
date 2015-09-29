describe_recipe "apps-newrelic::yaml" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "/srv/www/shared/config/newrelic.yml" do
    let(:app_user) { user "www" }
    let(:app_group) { group "www" }
    let(:yml) { file "/srv/www/shared/config/newrelic.yml" }
    let(:stat) { File.stat(yml.path) }

    it "exists" do
      yml.must_exist
    end

    it "is owned by the app user" do
      assert_equal app_user.uid, stat.uid
      assert_equal app_group.gid, stat.gid
    end

    it "is mode 660" do
      assert_equal "660".oct, (stat.mode & 007777)
    end

    it "does not serialize any special types" do
      yml.wont_include "!"
    end

    it "is configured for staging, including the license" do
      expected_yaml = {
        "license" => "abcdefghijklmnopqrstuvwxyz1234567890",
        "app_name" => "WWW (Staging)",
        "monitor_mode" => true,
        "developer_mode" => false,
        "log_level" => "info",
        "ssl" => false,
        "apdex_t" => 0.5,
        "capture_params" => false,
        "browser_monitoring" => {
          "auto_instrument" => true,
        },
        "transaction_tracer" => {
          "enabled" => true,
          "transaction_threshold" => "apdex_f",
          "record_sql" => "raw",
          "stack_trace_threshold" => 0.500,
        },
        "error_collector" => {
          "enabled" => true,
          "capture_source" => true,
          "ignore_errors" => "ActionController::RoutingError",
        },
      }

      actual_yaml = YAML.load_file(yml.path)[node['framework_environment']]
      assert_equal expected_yaml, actual_yaml
    end
  end

  describe "an application not hosted on this server" do
    it "does not create a newrelic.yml file" do
      file("/srv/princess/shared/config/newrelic.yml").wont_exist
    end
  end

  describe "an application hosted on this server but not using newrelic" do
    it "does not create a newrelic.yml file" do
      file("/srv/toad/shared/config/newrelic.yml").wont_exist
    end
  end
end
