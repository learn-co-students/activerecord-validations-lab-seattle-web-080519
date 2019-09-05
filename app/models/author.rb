class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :phone_number, length: {is: 10}
    # validates :phone_number, uniqueness: true
    validates :name, uniqueness: true
end
