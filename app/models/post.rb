class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :cb?

    CLICKYCLIKCY = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]
    def cb?
        if CLICKYCLIKCY.none? {|clicky| clicky.match title}
            errors.add(:title, "must be clicky clicky")
        end
    end
end
