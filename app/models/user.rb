class User < ApplicationRecord
    has_secure_password
    has_many :courses, class_name: "Subject", :foreign_key => "professor_id"
    has_many :enrollments, :foreign_key => "student_id"
    has_many :subjects, through: :enrollments, :foreign_key => "student_id"
    has_many :professors, through: :subjects, :foreign_key => "professor_id"
    has_many :students, through: :courses, :foreign_key => "professor_id"
    belongs_to :house, optional: true
    validates :name, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false}

   def self.all_students
        User.all.map {|user| user if !user.professor}
   end

end
