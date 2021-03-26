# SimpleCombineXls

combine excel cell like drawing 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_combine_xls'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simple_combine_xls

## Usage

You must define `variable` or `instance variable` if you want combine excel

Because their `object_id` is the same

For example

```rb
city1, city2, city3 = "成都", "南充", "自贡"
spec = "特色"
# menu1, menu2, menu3 object id is not the same
menu1, menu2, menu3 = "菜单", "菜单", "菜单"
scenic = "景点"
datas = [
  [spec,     spec,      spec,    spec,         spec],
  [city1,    menu1,    "串串",  scenic,      "春熙路"],
  [city1,    menu1,      nil,  scenic,      "黄龙溪"],
  [city1,    menu1,    "火锅",  scenic, "各种免费景点"],
  [city2,    menu2,    "米粉",  scenic,    "蓝天网吧"],
  [city2,    menu2,    "锅盔",  scenic,    "鼎盛网吧"],
  [city2,    menu2,      nil,  scenic,    "五星网吧"],
  [city2,    menu2,      nil,  scenic,    "各种网吧"],
  [city3,    menu3,  "鲜锅兔",  scenic,     "7天酒店"],
  [city3,    menu3,  "冷吃兔",  scenic,    "汉庭酒店"],
  [city3,    menu3,  "各种兔",  scenic,          nil],
  [city3,    menu3,"富顺豆花",  scenic,          nil]
]
simple_combine_xls = SimpleCombineXls.new(datas)
simple_combine_xls.drawing
# after drawing Hand over to spreadsheet
# you can use spreadsheet do anything
# Please see https://github.com/zdavatz/spreadsheet
simple_combine_xls.xls.write './asd.xls'
```

Will generate excel like this

<img src="http://smx.clouddn.com/1616733446268.jpg" />

## Notice

- `SimpleCombineXls` will converts all objects to string
- `SimpleCombineXls` default placeholder is `" "`

```rb
@str = "test"
# This is different for simple_combine_xls
# Because arr1.map(&:object_id) != arr2.map(&:object_id)
arr1 = [@str, @str, @str]
arr2 = ["test", "test", "test"]

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/SuMingXuan/simple_combine_xls.

