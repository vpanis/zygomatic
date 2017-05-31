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

require 'csv'

csv_comedians = File.read(Rails.root.join('lib', 'seeds', 'comedians.csv'))
csv = CSV.parse(csv_comedians, :headers => true, col_sep: ';')
puts csv_comedians

csv.each do |row|
  comedian = Comedian.new(name: row[0], short_description: row[2], full_description: row[3])
  comedian.picture_url = row[1]
  p comedian
  comedian.save!

end

# csv_skits = File.read(Rails.root.join('lib', 'seeds', 'skits.csv'))
# csv = CSV.parse(csv_skits, :headers => true, col_sep: ';')
# puts csv_skits

# csv.each do |skit|
#   Skit.create(name: skit[0], comedian_id: skit[1], youtube_path: skit[2], duration: skit[3], nb_of_views: skit    dian[1], full_description: comedian[2])
# end
