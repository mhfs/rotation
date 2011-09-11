module Rotation
  class Topic
    attr_accessor :name, :unit, :duration, :start_date, :first, :candidates

    def initialize(topic_name, params)
      @name       = topic_name
      @unit       = params["unit"]
      @duration   = params["duration"]
      @start_date = params["start_date"]
      @first      = params["first"]
      @candidates = params["candidates"]
    end
  end
end
