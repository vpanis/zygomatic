# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @comedian = Comedian.new
# @comedian.name = "Coluche"
# @comedian.picture_url = 'http://res.cloudinary.com/duwczzrpk/image/upload/v1496226108/avatar_humourist_hnpte0.png'
# @comedian.save!

# @skit = Skit.new
# @skit.name = "L'histoire d'un mec"
# @skit.youtube_path = "d4knSzXy2oU"
# @skit.duration = "5:35"
# @skit.short_description = "Le sketche mythique qui propulsa Coluche dans la cour des grands. A regarder sans modération"
# @skit.picture_url = 'http://res.cloudinary.com/duwczzrpk/image/upload/v1496150970/pic_skit_epmkwc.png'
# @skit.comedian = @comedian
# @skit.nb_of_views = 3498
# @skit.save!

csv_comedians = File.read(Rails.root.join('lib', 'seeds', 'comedians.csv'))
csv = CSV.parse(csv_comedians, :headers => true, col_sep: ';')
puts csv_comedians
csv.each do |row|
  comedian = Comedian.new(name: row[0], short_description: row[2], full_description: row[3])
  comedian.picture_url = row[1]
  p comedian
  comedian.save!
end

csv_skits = File.read(Rails.root.join('lib', 'seeds', 'skits2.csv'))
csv = CSV.parse(csv_skits, :headers => true, col_sep: ';')
puts csv_skits
csv.each do |row|
  skit = Skit.new(name: row[0], comedian_id: row[1], youtube_path: row[2], duration: row[3], nb_of_views: row[4], short_description: row[5], full_description: row[6], category: row[8])
  p skit
  skit.picture_url = row[7]
  p skit
  skit.save!
end

csv_users = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_users, :headers => true, col_sep: ';')
puts csv_users
csv.each do |row|
  user = User.create(first_name: row[0], last_name: row[1], email: row[2], fun_level: row[3], password: row[4])
  user.picture_url = row[4]
  p user.save!
end

csv_reviews = File.read(Rails.root.join('lib', 'seeds', 'reviews.csv'))
csv = CSV.parse(csv_reviews, :headers => true, col_sep: ';')
puts csv_reviews
csv.each do |row|
  Review.create(content: row[0], rating: row[1], user: User.find(row[2]), skit_id: row[3])
end

csv_playlists = File.read(Rails.root.join('lib', 'seeds', 'playlists.csv'))
csv = CSV.parse(csv_playlists, :headers => true, col_sep: ';')
puts csv_playlists
csv.each do |row|
  Playlist.create(name: row[0], user: User.find(row[1]))
end

csv_playlists_skits = File.read(Rails.root.join('lib', 'seeds', 'playlists_skits.csv'))
csv = CSV.parse(csv_playlists_skits, :headers => true, col_sep: ';')
puts csv_playlists_skits
csv.each do |row|
  PlaylistSkit.create(skit_id: row[0], playlist_id: row[1])
end



