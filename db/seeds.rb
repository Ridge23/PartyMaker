# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.find_or_create_by({name: 'Artist / DJ', plain_name: 'artist_dj'})
Role.find_or_create_by({name: 'Promoter / Club', plain_name: 'promoter_club'})

genres = Genre.create([
  { name: 'Breaks', enabled: true },
  { name: 'Hip-Hop', enabled: true },
  { name: 'Chill Out', enabled: true },
  { name: 'House', enabled: true },
  { name: 'Indie Dance / Nu Disco', enabled: true },
  { name: 'Deep House', enabled: true },
  { name: 'Minimal', enabled: true },
  { name: 'Drum & Bass', enabled: true },
  { name: 'Pop / Rock', enabled: true },
  { name: 'Dubstep', enabled: true },
  { name: 'Progressive House', enabled: true },
  { name: 'Electro House', enabled: true },
  { name: 'Psy-Trance', enabled: true },
  { name: 'Electronica', enabled: true },
  { name: 'Reggae / Dub', enabled: true },
  { name: 'Funk / R&B', enabled: true },
  { name: 'Tech House', enabled: true },
  { name: 'Glitch Hop', enabled: true },
  { name: 'Techno', enabled: true },
  { name: 'Hard Dance', enabled: true },
  { name: 'Trance', enabled: true },
  { name: 'Hardcore / Hard Techno', enabled: true }
])