class Enrollment < ApplicationRecord
    belongs_to :student, :class_name => :User
    belongs_to :subject 
    validates_uniqueness_of :subject_id, :scope => [:student_id]
end
