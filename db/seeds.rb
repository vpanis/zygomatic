# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@comedian = Comedian.new
@comedian.name = "Coluche"
@comedian.picture_url = 'http://res.cloudinary.com/duwczzrpk/image/upload/v1496226108/avatar_humourist_hnpte0.png'
@comedian.save!

@skit = Skit.new
@skit.name = "L'histoire d'un mec"
@skit.duration = "5:35"
@skit.short_description = "Le sketche mythique qui propulsa Coluche dans la cour des grands. A regarder sans modération"
@skit.picture_url = 'http://res.cloudinary.com/duwczzrpk/image/upload/v1496150970/pic_skit_epmkwc.png'
@skit.comedian = @comedian
@skit.nb_of_views = 3498
@skit.save!

