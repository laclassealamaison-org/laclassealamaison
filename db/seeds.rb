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
    Session.create!({
      classroom: classroom,
      scheduled_dt: available_time,
      live_url: nil,
      user: nil
    })
  end
end
puts "...ok"

puts "Success!"
