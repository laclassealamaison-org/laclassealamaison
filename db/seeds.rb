# rails db:seed:replant

puts "Building Classroom instances..."

Classroom.create!([
  { name: 'Maternelle', position: 1, color: 'orange' },
  { name: 'CP', position: 2, color: 'green' },
  { name: 'CE1', position: 3, color: 'red' },
  { name: 'CE2', position: 4, color: 'blue' },
  { name: 'CM1', position: 5, color: 'purple' },
  { name: 'CM2', position: 6, color: 'yellow' },
])
puts "...ok"


User.create!([
  { email: 'administrateur@laclassealamaison.org', password: 'admin@.org', role: :admin, first_name: 'Administrateur', last_name: 'Bénévole' },
  { email: 'parent@laclassealamaison.org', password: 'parent@.org', role: :responsible_parent },
  { email: 'utilisateur@laclassealamaison.org', password: 'user@.org', role: :user }
])
teacher = User.create!(email: 'professeur@laclassealamaison.org', password: 'teacher@.org', role: :teacher, first_name: 'Professeur', last_name: 'Bénévole')

User.all.map(&:confirm)

puts "Building Session instances..."

available_times = [
  DateTime.new(2020, 4, 1, 9), # 9h le 4 avril 2020
  DateTime.new(2020, 4, 1, 10),
  DateTime.new(2020, 4, 1, 11),
  DateTime.new(2020, 4, 1, 14),
  DateTime.new(2020, 4, 1, 15),
  DateTime.new(2020, 4, 1, 16),
  DateTime.new(2020, 4, 2, 11),
  DateTime.new(2020, 4, 3, 14),
  DateTime.new(2020, 4, 4, 15),
  DateTime.new(2020, 4, 5, 6)
]

Classroom.all.each do |classroom|
  available_times.each do |available_time|
    ClassroomAnimation.create!({
      classroom: classroom,
      starts_at: available_time,
      live_url: nil,
      user: teacher
    })
  end
end

# Build a live session
ClassroomAnimation.create!({
  classroom: Classroom.find_by(name: "CP"),
  starts_at: Time.now.utc,
  live_url: 'https://www.google.com/',
  user: teacher
})
puts "...ok"

puts "Building Resource instances..."
Resource.create!([
  { name: 'Lumni', url: 'https://www.lumni.fr/primaire/maternelle', classroom: Classroom.find_by(name: "Maternelle"), description: "Lumni est une offre de 3000 contenus multimédias (vidéos, audios, articles, pistes pédagogiques) gratuits pour les élèves, parents, enseignants et médiateurs, qui permet un accès à la culture, au savoir et à la connaissance."},
  { name: 'Le Monde des Zibous', url: 'https://www.youtube.com/channel/UCcohFTzyHqEkehrvCXR6f9Q/', classroom: Classroom.find_by(name: "Maternelle"), description: "Bienvenue dans le Monde des Zibous, la chaîne préférée des tous-petits ... et des moins petits ! Dans le Monde des Zibous, on peut trouver des comptines françaises, des histoires merveilleuses mais aussi des vidéos ludiques et éducatives pour apprendre en chantant et en s'amusant !"},
  { name: 'Le Monde des Titounis', url: 'https://www.youtube.com/user/ssebastienn/', classroom: Classroom.find_by(name: "Maternelle"), description: "Bienvenue sur la chaîne pour enfants : Monde des Titounis ! Ici, les petits enfants trouveront chaque semaine de nouvelles vidéos pour chanter (avec une sélection des meilleurs comptines et chansons en français et en anglais), apprendre le français (avec des vidéos éducatives pour apprendre l'alphabet, les chiffres, les couleurs etc...) et rêver (avec une sélection des meilleurs contes et histoires de Grimm, Perrault ou Andersen à écouter et à regarder en famille)."},
  { name: 'Didou', url: 'https://www.youtube.com/user/DidouMillimages', classroom: Classroom.find_by(name: "Maternelle"), description: "Didou est un dessin-animé éducatif préscolaire qui apprend aux enfants à dessiner! Chaque semaine, les enfants découvrent un nouvel épisode et s'exercent au dessin et au coloriage. Ils apprendront aussi bien à dessiner des animaux, que des paysages ou des véhicules."},
  { name: 'Méditation pour les enfants', url: 'https://www.youtube.com/playlist?list=PLqSk7Cu0HAF54zStfBWR2jGkGLco4dFTN', classroom: Classroom.find_by(name: "Maternelle"), description: 'Playlist de vidéos de méditation pour les enfants à partir de 3 ans.'},

  { name: 'C\'est Pas Sorcier', url: 'https://www.youtube.com/user/cestpassorcierftv', classroom: Classroom.find_by(name: "CP"), description: "C'est pas sorcier, la chaîne officielle. La science évolue sans cesse, certaines données chiffrées peuvent avoir changé depuis la réalisation de cette émission, certaines découvertes ont pu être faites : comme tout journaliste multipliez vos sources d'information."},
  { name: 'Lumni', url: 'https://www.lumni.fr/primaire/cp', classroom: Classroom.find_by(name: "CP"), description: "Lumni est une offre de 3000 contenus multimédias (vidéos, audios, articles, pistes pédagogiques) gratuits pour les élèves, parents, enseignants et médiateurs, qui permet un accès à la culture, au savoir et à la connaissance."},
  { name: 'Méditation pour les enfants', url: 'https://www.youtube.com/playlist?list=PLqSk7Cu0HAF54zStfBWR2jGkGLco4dFTN', classroom: Classroom.find_by(name: "CP"), description: 'Playlist de vidéos de méditation pour les enfants à partir de 3 ans.'},

  { name: 'C\'est Pas Sorcier', url: 'https://www.youtube.com/user/cestpassorcierftv', classroom: Classroom.find_by(name: "CE1"), description: "C'est pas sorcier, la chaîne officielle. La science évolue sans cesse, certaines données chiffrées peuvent avoir changé depuis la réalisation de cette émission, certaines découvertes ont pu être faites : comme tout journaliste multipliez vos sources d'information."},
  { name: 'Lumni', url: 'https://www.lumni.fr/primaire/ce1', classroom: Classroom.find_by(name: "CE1"), description: "Lumni est une offre de 3000 contenus multimédias (vidéos, audios, articles, pistes pédagogiques) gratuits pour les élèves, parents, enseignants et médiateurs, qui permet un accès à la culture, au savoir et à la connaissance."},
  { name: 'Méditation pour les enfants', url: 'https://www.youtube.com/playlist?list=PLqSk7Cu0HAF54zStfBWR2jGkGLco4dFTN', classroom: Classroom.find_by(name: "CE1"), description: 'Playlist de vidéos de méditation pour les enfants à partir de 3 ans.'},

  { name: 'C\'est Pas Sorcier', url: 'https://www.youtube.com/user/cestpassorcierftv', classroom: Classroom.find_by(name: "CE2"), description: "C'est pas sorcier, la chaîne officielle. La science évolue sans cesse, certaines données chiffrées peuvent avoir changé depuis la réalisation de cette émission, certaines découvertes ont pu être faites : comme tout journaliste multipliez vos sources d'information."},
  { name: 'Lumni', url: 'https://www.lumni.fr/primaire/ce2', classroom: Classroom.find_by(name: "CE2"), description: "Lumni est une offre de 3000 contenus multimédias (vidéos, audios, articles, pistes pédagogiques) gratuits pour les élèves, parents, enseignants et médiateurs, qui permet un accès à la culture, au savoir et à la connaissance."},
  { name: 'Méditation pour les enfants', url: 'https://www.youtube.com/playlist?list=PLqSk7Cu0HAF54zStfBWR2jGkGLco4dFTN', classroom: Classroom.find_by(name: "CE2"), description: 'Playlist de vidéos de méditation pour les enfants à partir de 3 ans.'},

  { name: 'C\'est Pas Sorcier', url: 'https://www.youtube.com/user/cestpassorcierftv', classroom: Classroom.find_by(name: "CM1"), description: "C'est pas sorcier, la chaîne officielle. La science évolue sans cesse, certaines données chiffrées peuvent avoir changé depuis la réalisation de cette émission, certaines découvertes ont pu être faites : comme tout journaliste multipliez vos sources d'information."},
  { name: 'Lumni', url: 'https://www.lumni.fr/primaire/cm1', classroom: Classroom.find_by(name: "CM1"), description: "Lumni est une offre de 3000 contenus multimédias (vidéos, audios, articles, pistes pédagogiques) gratuits pour les élèves, parents, enseignants et médiateurs, qui permet un accès à la culture, au savoir et à la connaissance."},
  { name: 'Méditation pour les enfants', url: 'https://www.youtube.com/playlist?list=PLqSk7Cu0HAF54zStfBWR2jGkGLco4dFTN', classroom: Classroom.find_by(name: "CM1"), description: 'Playlist de vidéos de méditation pour les enfants à partir de 3 ans.'},

  { name: 'C\'est Pas Sorcier', url: 'https://www.youtube.com/user/cestpassorcierftv', classroom: Classroom.find_by(name: "CM2"), description: "C'est pas sorcier, la chaîne officielle. La science évolue sans cesse, certaines données chiffrées peuvent avoir changé depuis la réalisation de cette émission, certaines découvertes ont pu être faites : comme tout journaliste multipliez vos sources d'information."},
  { name: 'Lumni', url: 'https://www.lumni.fr/primaire/cm2', classroom: Classroom.find_by(name: "CM2"), description: "Lumni est une offre de 3000 contenus multimédias (vidéos, audios, articles, pistes pédagogiques) gratuits pour les élèves, parents, enseignants et médiateurs, qui permet un accès à la culture, au savoir et à la connaissance."},
  { name: 'Méditation pour les enfants', url: 'https://www.youtube.com/playlist?list=PLqSk7Cu0HAF54zStfBWR2jGkGLco4dFTN', classroom: Classroom.find_by(name: "CM2"), description: 'Playlist de vidéos de méditation pour les enfants à partir de 3 ans.'}
])
puts "...ok"

puts "Success!"
