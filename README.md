## 大众点评API

### 安装

```sh
gem install 'dian_ping'
```

### 优点

#### 可选参数都映射为方法链
#### 参考[API](http://developer.dianping.com/app/api/v1/business/find_businesses)

### 使用

```ruby
require 'dian_ping'
dp = DianPing.new(key: 'Your key', secret: 'Your secret')

# 搜索商户
# 搜索上海有优惠卷的商家
dp.has_coupon.city('上海').find

# 分页
dp.city('上海').page(1).find

# 获取指定商户信息
dp.shop('2951611')

# 获取指定商户最新点评片断
dp.reviews('2951611')

# 获取支持商户搜索的最新城市列表
dp.cities

# 获取支持商户搜索的最新分类列表
dp.categories

# 获取支持商户搜索的最新城市下属区域列表
dp.regions('上海')

# 获取支持在线预订的全部商户ID列表
dp.reservations('上海')

# 获取当前在线的全部团购ID列表
dp.deals('上海')

# 获取指定团购信息
dp.deal('1-5097286')

# 通过api地址调用
dp.get('/v1/deal/get_deals_by_business_id', {city: '上海', business_id: '2951611'})

```

### Rails

* 在Gemfile添加gem
* 执行bundle exec rake dian_ping:install
* 在config/dian_ping.yml补全
* 使用DP.进行调用


