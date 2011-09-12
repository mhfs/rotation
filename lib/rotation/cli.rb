require "thor"

module Rotation
  class CLI < Thor
    CONFIG_PATH = File.expand_path("~/.rotation")

    desc "init TOPIC", "Init a new dummy topic config in your ~/.rotation file."
    def init(topic_name)
      config = File.exists?(CONFIG_PATH) ? YAML.load_file(CONFIG_PATH) : {}
      config[topic_name] = { "duration" => 1, "start_date" => Date.today, "first" => "Huey", "candidates" => ["Huey", "Dewey", "Louie"] }
      File.open(CONFIG_PATH, "w") do |out|
        YAML.dump(config, out)
      end
    end

    desc "responsibles", "Gives the responsibles for all your configured topics"
    def responsibles
      load_settings
      Configuration.config_store.each do |name, topic|
        say_status(name, topic.responsible)
      end
    end

    desc "responsible TOPIC", "Tells you who is in charge for a given topic."
    def responsible(topic_name)
      load_settings
      topic = Configuration.fetch(topic_name)
      say_status(topic_name, topic.responsible)
    end

    protected

    def load_settings
      Configuration.load(CONFIG_PATH)
    end
  end
end
