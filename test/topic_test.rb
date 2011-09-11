require "test_helper"

class TopicTest < Test::Unit::TestCase
  setup do
    @topic = Rotation::Topic.new("test_topic", {
      "duration"   => 2,
      "start_date" => Date.new(2011, 9, 5),
      "first"      => "one",
      "candidates" => ["one", "two", "three"]
    })
  end

  context "#week_delta" do
    test "is 0 for same week" do
      assert_equal 0, @topic.week_delta(@topic.start_date, Date.new(2011, 9, 10))
    end

    test "is 1 for next week" do
      assert_equal 1, @topic.week_delta(@topic.start_date, Date.new(2011, 9, 11))
    end

    test "is -1 for previous week" do
      assert_equal -1, @topic.week_delta(@topic.start_date, Date.new(2011, 9, 3))
    end

    test "is not negative for lower dates in following years" do
      assert_equal 17, @topic.week_delta(@topic.start_date, Date.new(2012, 1, 3))
    end

    test "is negative for higher dates in previous years" do
      assert_equal -36, @topic.week_delta(@topic.start_date, Date.new(2010, 12, 31))
    end
  end

  context "#cycle" do
    test "is 0 for up to duration value" do
      assert_equal 0, @topic.cycle(0)
      assert_equal 0, @topic.cycle(1)
    end

    test "is 1 for up to twice the duration value" do
      assert_equal 1, @topic.cycle(2)
      assert_equal 1, @topic.cycle(3)
    end

    test "is 2 for up to three time the duration value" do
      assert_equal 2, @topic.cycle(4)
      assert_equal 2, @topic.cycle(5)
    end
  end

  context "#responsible_index and #responsible" do
    test "is 0 in the first cycle" do
      date = Date.new(2011, 9, 10)
      assert_equal 0,     @topic.responsible_index(date)
      assert_equal "one", @topic.responsible(date)
    end

    test "is 1 for second cycle" do
      date = Date.new(2011, 9, 18)
      assert_equal 1,     @topic.responsible_index(date)
      assert_equal "two", @topic.responsible(date)
    end

    test "is 2 for third cycle" do
      date = Date.new(2011, 10, 8)
      assert_equal 2,       @topic.responsible_index(date)
      assert_equal "three", @topic.responsible(date)
    end

    test "is 0 again for fourth cycle" do
      date = Date.new(2011, 10, 22)
      assert_equal 0,     @topic.responsible_index(date)
      assert_equal "one", @topic.responsible(date)
    end

    test "is 2 for first cycle if first candidate says so" do
      @topic.first = "three"
      date = Date.new(2011, 9, 10)
      assert_equal 2,       @topic.responsible_index(date)
      assert_equal "three", @topic.responsible(date)
    end
  end
end
