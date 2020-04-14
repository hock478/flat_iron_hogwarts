# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Subject.destroy_all
Enrollment.destroy_all
House.destroy_all



house1 = House.create(name: "Gryffindor", img: "gryffindor.png")
house2 = House.create(name: "Slytherin", img: "slytherin.png")
house3 = House.create(name: "Ravenclaw",img: "raveclaw.png")
house4 = House.create(name: "Hufflepuff", img: "hufflepuff.png")

stud1 = User.create(name: "alex", email: "alex@dd.com", password_digest: BCrypt::Password.create('password'))
prof1 = User.create(name: "chine", email: "chine@dd.com", password_digest: BCrypt::Password.create('password'), house: house3, professor: true)
sub1 = Subject.create(name: "Something 101", professor: prof1)
enr1 = Enrollment.create(student: stud1, subject: sub1)


user1 = User.create(name: "Harry Potter", email: "harry@potter.com", password_digest: BCrypt::Password.create('password'), house: house1)
user2 = User.create(name: "Ron Weasley", email: "ron@potter.com", password_digest: BCrypt::Password.create('password'), house: house1)
user3 = User.create(name: "Hermoine Granger", email: "hermoine@potter.com", password_digest: BCrypt::Password.create('password'), house: house1)
user4 = User.create(name: "Draco Malfoy", email: "draco@potter.com", password_digest: BCrypt::Password.create('password'), house: house2)
user5 = User.create(name: "Luna Lovegood",email: "luna@potter.com", password_digest: BCrypt::Password.create('password'), house: house3)
user6 = User.create(name: "Cho Chang", email: "cho@potter.com", password_digest: BCrypt::Password.create('password'), house: house3)
user7 = User.create(name: "Cedric Diggory", email: "cedric@potter.com", password_digest: BCrypt::Password.create('password'), house: house4)

user8 = User.create(name: "Minverva McGonagall", email: "minerva@potter.com", password_digest: BCrypt::Password.create('password'), house: house1, professor: true)
user9 = User.create(name: "Severus Snape", email: "severus@potter.com", password_digest: BCrypt::Password.create('password'), house: house2, professor: true)
user10 = User.create(name: "Pomona Sprout", email: "pomona@potter.com", password_digest: BCrypt::Password.create('password'), house: house4, professor: true)
user11 = User.create(name: "Filius Flitwick", email: "filius@potter.com", password_digest: BCrypt::Password.create('password'), house: house3, professor: true)


sub2 = Subject.create(name: "Transfiguration", professor: user8)
sub3 = Subject.create(name: "Potions 101", professor: user9)
sub4 = Subject.create(name: "Herbology", professor: user10)
sub5 = Subject.create(name: "Charms", professor: user11)

Enrollment.create(student: user1 , subject: sub2 )
Enrollment.create(student: user2, subject: sub2)
Enrollment.create(student: user3, subject: sub2)
Enrollment.create(student: user2, subject: sub3 )
Enrollment.create(student: user4, subject: sub3)
Enrollment.create(student: user5, subject: sub3)
Enrollment.create(student: user3, subject: sub4)
Enrollment.create(student: user2, subject: sub4)
Enrollment.create(student: user1, subject: sub4)
Enrollment.create(student: user7, subject: sub5)
Enrollment.create(student: user6, subject: sub5)
Enrollment.create(student: user3, subject: sub5)
Enrollment.create(student: user2, subject: sub5)

