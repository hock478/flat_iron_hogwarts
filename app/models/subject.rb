class Subject < ApplicationRecord
    belongs_to :professor, :class_name => :User, required: false 
    # belongs_to :user, foreign_key: :professor_id, primary_key: :user_id
    has_many :enrollments
    has_many :students, through: :enrollments
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    # validates :professor, presence: true
    
end
