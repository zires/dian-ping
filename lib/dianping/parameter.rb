# encoding: utf-8
require 'dianping/common'
require 'dianping/business'

module DP
  class Parameter < Hash
    include DP::Common
    include DP::Business

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def add(key, value)
      self[key] = value
      self
    end

    def get(route)
      client.get(route, self)
    end

  end
end

