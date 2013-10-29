dian-ping
=========

[ruby]大众点评api

Install
=========

gem install 'dian_ping'

Usage
=========

```ruby
require 'dian_ping'

dp = DianPing.new(key: 'Your key', secret: 'Your secret')
dp.coordinate([31.18268013000488,121.42769622802734]).page(1).has_coupon.get('/v1/business/find_businesses')

```
