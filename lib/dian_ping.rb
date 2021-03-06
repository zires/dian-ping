# encoding: utf-8
require "digest/md5"
require 'httparty'
require 'dianping/parameter'

class DianPing
  include HTTParty

  VERSION = '0.1.0'

  attr_accessor :key, :secret

  base_uri 'http://api.dianping.com'

  def initialize(opts = {})
    @key, @secret = opts.values_at(:key, :secret)
  end

  # @param route [String] 请求的URL
  # @param param [Hash] 传递的参数
  # @return [Hash]
  #
  # @example
  #   dp = DianPing.new(key: 'Your key', secret: 'Your secret')
  #   dp.get('/v1/reservation/get_all_id_list', {city: '上海'})
  #
  def get(route, param = {})
    param[:sign]   = signature(param)
    param[:appkey] = @key
    self.class.get route, query: param
  end

  private

    # 签名
    def signature(param)
      plaintext = param.keys.sort.map{|k| "#{k}#{param[k]}"}.join
      Digest::SHA1.hexdigest("#{@key}#{plaintext}#{@secret}").upcase
    end

    def parameter
      Parameter.new(self)
    end

    def method_missing(method_name, *args, &block)
      super unless parameter.respond_to?(method_name)
      if args.empty?
        parameter.send(method_name)
      else
        parameter.send(method_name, args.first)
      end
    end

end

require 'dianping/railtie' if defined?(Rails)
