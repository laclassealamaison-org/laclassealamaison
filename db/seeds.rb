# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Classroom.create([
  { name: 'Maternelle', position: 1, color: 'orange', videoconference_url: 'https://dilotalk.cloud/laclassealamaison-org-maternelle' },
  { name: 'CP', position: 2, color: 'green', videoconference_url: 'https://dilotalk.cloud/laclassealamaison-org-cp' },
  { name: 'CE1', position: 3, color: 'red', videoconference_url: 'https://dilotalk.cloud/laclassealamaison-org-ce1' },
  { name: 'CE2', position: 4, color: 'blue', videoconference_url: 'https://dilotalk.cloud/laclassealamaison-org-ce2' },
  { name: 'CM1', position: 5, color: 'purple', videoconference_url: 'https://dilotalk.cloud/laclassealamaison-org-cm1' },
  { name: 'CM2', position: 6, color: 'yellow', videoconference_url: 'https://dilotalk.cloud/laclassealamaison-org-cm2' },
])
