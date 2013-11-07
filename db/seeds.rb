# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
fantasies = Category.create(name: "Fantasies")
comedies = Category.create(name: "Comedies")
dramas = Category.create(name: "Dramas")

Video.create(title: "monk", description: "monk video", urlsm: "/tmp/monk.jpg", urllg: "/tmp/monk_large.jpg", category: dramas)
Video.create(title: "futurama", description: "futurama video", urlsm: "/tmp/futurama.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "family guy", description: "family guy video", urlsm: "/tmp/family_guy.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "monk", description: "monk video", urlsm: "/tmp/monk.jpg", urllg: "/tmp/monk_large.jpg", category: dramas)
Video.create(title: "futurama", description: "futurama video", urlsm: "/tmp/futurama.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "family guy", description: "family guy video", urlsm: "/tmp/family_guy.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "south park", description: "south park video", urlsm: "/tmp/south_park.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "south park", description: "south park video", urlsm: "/tmp/south_park.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "south park", description: "south park video", urlsm: "/tmp/south_park.jpg", urllg: "/tmp/monk_large.jpg", category: comedies)
hackers = Video.create(title: "hackers", description: "hackers video", urlsm: "/tmp/hackers.jpeg", urllg: "/tmp/hackers_large.jpeg", category: fantasies)
Video.create(title: "anon", description: "anon video", urlsm: "/tmp/legion.jpeg", urllg: "/tmp/hackers_large.jpeg", category: fantasies)

firstuser = User.create(full_name: "first user", password: "first", email: "first@first.com")

Review.create(user: firstuser, video: hackers, rating: 5, content: "da shizznick son!")
Review.create(user: firstuser, video: hackers, rating: 3, content: "angelina joli .. nuff said!")
