class User < ApplicationRecord
     has_secure_password
     has_many :courses, class_name: "Subject", :foreign_key => "professor_id"
     has_many :enrollments, :foreign_key => "student_id"
     has_many :subjects, through: :enrollments, :foreign_key => "student_id"
     has_many :professors, through: :subjects, :foreign_key => "professor_id"
     has_many :students, through: :courses, :foreign_key => "professor_id"
     has_many :posts
     has_many :comments
     belongs_to :house, optional: true
     validates :name, presence: true
     validates :email, presence: true, uniqueness: {case_sensitive: false}
     accepts_nested_attributes_for :courses
   
     
     def self.all_students
        students = []
        User.all.each {|user| students << user if !user.professor && user }
        students
   end

   def sort_me(num)
     if num <= 5
          house = "Hufflepuff"
     elsif num >=6 && num <=9
          house = "Ravenclaw"
     elsif num >=10 && num <=13
          house = "Slytherin"
     else  
          house = "Gryffindor"
     end
     self.update(house: House.find_by(name: house))
     self.save
   end
end

 
 
 