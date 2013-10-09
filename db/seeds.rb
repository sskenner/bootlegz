# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do |i|
  Video.create(title: "monk #{i+1}", description: "monk video", urlsm: "/tmp/monk.jpg", urllg: "/tmp/monk_large.jpg")
  Video.create(title: "futurama #{i+1}", description: "futurama video", urlsm: "/tmp/futurama.jpg", urllg: "/tmp/monk_large.jpg")
  Video.create(title: "family guy #{i+1}", description: "family guy video", urlsm: "/tmp/family_guy.jpg", urllg: "/tmp/monk_large.jpg")
  Video.create(title: "south park #{i+1}", description: "south park video", urlsm: "/tmp/south_park.jpg", urllg: "/tmp/monk_large.jpg")
end

Category.create(name: "Comedies TV")
Category.create(name: "Drama TV")
Category.create(name: "Reality TV")

category = Category.find(1)
videos = Video.limit(6)
videos.each do |video|
  video.categories << category
end

category = Category.find(2)
videos = Video.limit(6).offset(6)
videos.each do |video|
  video.categories << category
end
