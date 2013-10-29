# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

require "dian_ping"

Gem::Specification.new do |s|
  s.name        = "dian_ping"
  s.version     = DianPing::VERSION
  s.authors     = ["zires"]
  s.email       = ["zshuaibin@gmail.com"]
  s.homepage    = "https://github.com/zires/dian-ping"
  s.summary     = "大众点评开放平台ruby版SDK"
  s.description = "大众点评开放平台ruby版SDK-http://developer.dianping.com/app/api"

  s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "httparty"

  s.add_development_dependency "turn"
  s.add_development_dependency "minitest"
  s.add_development_dependency "yard"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"

end
