require "test_helper"

class ConfigurationTest < Test::Unit::TestCase
  setup do
    Rotation::Configuration.load("./test/fixtures/sample_config.yml")
  end

  test "load settings from file" do
    assert Rotation::Configuration.fetch("cool_topic").is_a?(Rotation::Topic)
  end

  test "correctly feed topics" do
    topic = Rotation::Configuration.fetch("cool_topic")
    assert_equal "cool_topic", topic.name
    assert_equal "week", topic.unit
    assert_equal 2, topic.duration
    assert_equal Date.new(2011, 9, 13), topic.start_date
    assert_equal "one", topic.first
    assert_equal ["one", "two", "three"], topic.candidates
  end
end
