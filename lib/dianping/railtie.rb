# encoding: utf-8
module DP
  class Railtie < ::Rails::Railtie
    generators do
      require "generators/dianping/install_generator"
    end

    initializer "dian_ping.setup" do
      config_file = Rails.root.join("config", "dian_ping.yml")
      if config_file.file?
        begin
          options = YAML.load_file(config_file)[Rails.env]
        rescue Exception => e
          puts "There is a configuration error with the current dian_ping.yml"
          puts e.message
        end
      end
    end
  end
end