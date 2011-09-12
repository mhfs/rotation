module Rotation
  class Topic
    attr_accessor :name, :duration, :start_date, :first, :candidates

    def initialize(topic_name, params)
      @name       = topic_name
      @duration   = params["duration"]
      @start_date = params["start_date"]
      @first      = params["first"]
      @candidates = params["candidates"]
    end

    def responsible(date = Date.today)
      candidates[responsible_index(date)]
    end

    def responsible_index(date)
      unit_delta = week_delta(start_date, date)
      (cycle(unit_delta) + candidates.index(first)) % candidates.size
    end

    def cycle(unit_delta)
      (unit_delta / duration.to_f).floor
    end

    def week_delta(d1, d2)
      year_difference = (d2.year - d1.year) * 52
      year_difference + (d2 - d2.wday).yday / 7 - (d1 -d1.wday).yday / 7
    end
  end
end
