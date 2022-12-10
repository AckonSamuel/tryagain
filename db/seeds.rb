# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_st = Student.create(name: 'Samuel', email: 'ackons@gmail.com',
                          phone_number: '0557693112', programme_name: 'Electrical')
second_st = Student.create(name: 'Ackon', email: 'ackons@gmail.com',
                           phone_number: '0557693112', programme_name: 'Electrical')
third_st = Student.create(name: 'Yaw', email: 'ackons@gmail.com',
                          phone_number: '0557693112', programme_name: 'Electrical')
fourth_st = Student.create(name: 'Ekow', email: 'ackons@gmail.com',
                           phone_number: '0557693112', programme_name: 'Electrical')

fourth_staff = Staff.create(name: 'Ekow', email: 'ackons@gmail.com',
                            phone_number: '0557693112')

first_club = Club.create(email: 'ackons433@gmail.com',
                         group: 'IT', name: 'Leetcode Campus', telephone_number: '0557693112')

second_club = first_club = Club.create(email: 'ackons433@gmail.com',
                                       group: 'IT', name: 'Hackerrank Campus', telephone_number: '0557693112')

th = ClubStudent.create(club: first_club, student: first_st)
ClubStudent.create(club: second_club, student: second_st)
ClubStudent.create(club: second_club, student: third_st)
ClubStudent.create(club: second_club, student: fourth_st)

first_staff = ClubStaff.create(club: first_club, staff: fourth_staff)

Patron.create(club_staff: first_staff)

Executive.create(portfolio: 'President', club_student: th)
