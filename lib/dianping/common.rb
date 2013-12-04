# encoding: utf-8
class DianPing
  module Common

    # 根据是否有优惠券来筛选返回的商户
    # 1:有，0:没有
    def has_coupon
      add :has_coupon, 1
    end

    def has_not_coupon
      add :has_coupon, 0
    end

    # 根据是否有团购来筛选返回的商户，1:有，0:没有
    def has_deal
      add :has_deal, 1
    end

    def has_not_deal
      add :has_deal, 0
    end

    # 每页返回的商户结果条目数上限，最小值1，最大值40，如不传入默认为20
    def limit(number)
      warn 'limit 最大值40' if number > 40
      add :limit, number
    end

    # 搜索半径，单位为米，最小值1，最大值5000，如不传入默认为1000
    def radius(number)
      warn 'radius 最大值5000' if number > 5000
      add :radius, number
    end

    # category
    #   分类名，可选范围见相关API返回结果；支持同时输入多个分类，以逗号分隔，最大不超过5个

    # offset_type
    #   偏移类型，0:未偏移，1:高德坐标系偏移，2:图吧坐标系偏移，如不传入，默认值为0

    # keyword
    #   关键词，搜索范围包括商户名、地址、标签等

    # out_offset_type
    #   传出经纬度偏移类型，1:高德坐标系偏移，2:图吧坐标系偏移，如不传入，默认值为1

    # platform
    #   传出链接类型，1:web站链接（适用于网页应用），2:HTML5站链接（适用于移动应用和联网车载应用），如不传入，默认值为1

    # sort
    #   结果排序
    #   1:默认，
    #   2:星级高优先，
    #   3:产品评价高优先，
    #   4:环境评价高优先，
    #   5:服务评价高优先，
    #   6:点评数量多优先，
    #   7:离传入经纬度坐标距离近优先，
    #   8:人均价格低优先，
    #   9：人均价格高优先

    # page
    #   页码，如不传入默认为1，即第一页

    # format
    #   返回数据格式，可选值为json或xml，如不传入，默认值为json
    [:city, :category, :offset_type, :keyword, :out_offset_type, :platform, :sort, :page, :format].each do |key|
      define_method(key) {|value|
        add key, value
      }
    end

  end
end
