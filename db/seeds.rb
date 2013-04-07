# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "ROLES"
YAML.load(ENV["ROLES"]).each do |role|
  Role.find_or_create_by_name({name: role}, without_protection: true)
  puts "role: " << role
end

puts "DEFAULT USERS"
user = User.find_or_create_by_email email: ENV['SYSTEM_EMAIL'].dup,
     password: ENV['SYSTEM_PASSWORD'], password_confirmation: ENV['SYSTEM_PASSWORD']
puts 'user: ' << user.email
user.add_role :admin
