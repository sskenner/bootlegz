# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do |i|
  Video.create(title: "monk #{i+1}", description: "monk video", urlsm: "file:///Users/esskay/3tl/myflixsk/public/tmp/monk.jpg", urllg: "file:///Users/esskay/3tl/myflixsk/public/tmp/monk_large.jpg")
  Video.create(title: "futurama #{i+1}", description: "futurama video", urlsm: "file:///Users/esskay/3tl/myflixsk/public/tmp/futurama.jpg", urllg: "file:///Users/esskay/3tl/myflixsk/public/tmp/monk_large.jpg")
  Video.create(title: "family guy #{i+1}", description: "family guy video", urlsm: "file:///Users/esskay/3tl/myflixsk/public/tmp/family_guy.jpg", urllg: "file:///Users/esskay/3tl/myflixsk/public/tmp/monk_large.jpg")
  Video.create(title: "south park #{i+1}", description: "south park video", urlsm: "file:///Users/esskay/3tl/myflixsk/public/tmp/south_park.jpg", urllg: "file:///Users/esskay/3tl/myflixsk/public/tmp/monk_large.jpg")
end
