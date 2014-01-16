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
      self[key] = value if value
      self
    end

    def get(route)
      client.get(route, self)
    end

    # 获取指定商户信息
    def business(id)
      add :business_id, id
      get '/v1/business/get_single_business'
    end

    # 获取指定商户最新点评片断
    def reviews(id)
      add :business_id, id
      get '/v1/review/get_recent_reviews'
    end

    # 获取支持商户搜索的最新分类列表
    def categories(city = nil)
      add :city, city
      get '/v1/metadata/get_categories_with_businesses'
    end

    # 获取支持商户搜索的最新城市下属区域列表
    def regions(city = nil)
      add :city, city
      get '/v1/metadata/get_regions_with_businesses'
    end

    # 获取支持在线预订的全部商户ID列表
    def reservations(city)
      add :city, city
      get '/v1/reservation/get_all_id_list'
    end

    # 获取当前在线的全部团购ID列表
    def deals(city)
      add :city, city
      get '/v1/deal/get_all_id_list'
    end

    # 获取指定团购信息
    def deal(deal_id)
      add :deal_id, deal_id
      get '/v1/deal/get_single_deal'
    end

  end
end

