# See http://docs.ruby-lang.org/ja/2.3.0/library/date.html
require 'date'

today   = Date.today
today_  = Date.new(2016, 4, 22)
today__ = Date.parse('2016-04-22')
p today
p today_
p today__

p today.year
p today.month
p today.day
