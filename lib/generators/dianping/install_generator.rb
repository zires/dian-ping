# encoding: utf-8
module DP
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      # Create open_qq.yml under config/initializers/
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a ThemePark initializer file."
      def copy_initializer
        template "dian_ping.yml", "config/dian_ping.yml"
      end

    end
  end
end
