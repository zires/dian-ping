# encoding: utf-8
require 'dianping/common'
require 'dianping/business'

class DianPing
  class Parameter < Hash
    include Common
    include Business

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

    def business(id)
      add :business_id, id
      get '/v1/business/get_single_business'
    end

  end
end

