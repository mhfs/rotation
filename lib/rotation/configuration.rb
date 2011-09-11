module Rotation
  module Configuration
    extend self

    def load(config_path = "~/.rotation")
      configs = YAML.load_file(config_path)
      configs.each { |topic_name, params| config_store[topic_name] = Topic.new(topic_name, params) }
    end

    def config_store
      @config ||= {}
    end

    def fetch(topic_name)
      config_store[topic_name]
    end
  end
end
