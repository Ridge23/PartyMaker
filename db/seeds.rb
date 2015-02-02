# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.connection.execute('TRUNCATE ' + Role.table_name + ' RESTART IDENTITY')

Role.find_or_create_by({name: 'Artist / DJ', plain_name: 'artist_dj'})
Role.find_or_create_by({name: 'Promoter / Club', plain_name: 'promoter_club'})

ActiveRecord::Base.connection.execute('TRUNCATE ' + Genre.table_name + ' RESTART IDENTITY')

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

ActiveRecord::Base.connection.execute('TRUNCATE ' + Country.table_name + ' RESTART IDENTITY')

countries_csv_path = File.join(Rails.root, 'db', 'GeoIPCountryWhois.csv')

File.open(countries_csv_path).each do |line|
  country_array = line.split(',')
  if !Country.find_by_iso_name(country_array[4].gsub(/\s|"|'/, ''))
    Country.create({ name: country_array[5].gsub(/\s|"|'/, ''), iso_name: country_array[4].gsub(/\s|"|'/, '')})
  end
end

ActiveRecord::Base.connection.execute('TRUNCATE ' + City.table_name + ' RESTART IDENTITY')

cities_csv_path = File.join(Rails.root, 'db', 'GeoLiteCity-Location.csv')

File.open(cities_csv_path).each do |line|
  if line
    city_array = line.split(',')
    if city_array[1] and city_array[3]
      city_country = Country.find_by_iso_name(city_array[1].gsub(/\s|"|'/, ''))
      if city_country
        City.create({ name: city_array[3].gsub(/\s|"|'/, ''), country_id: city_country.id})
      end
    end
  end
end