class Member < ApplicationRecord
    after_initialize :set_role
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 8 }
    
    def set_role
        self.role_id = Role.find_by(title: "Member").id
    end
end
