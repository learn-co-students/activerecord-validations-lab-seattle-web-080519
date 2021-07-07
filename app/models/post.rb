
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w( Fiction Non-Fiction )}
    validate :clickbait

private

    def clickbait
        if title == nil
            return false
        end

        click_bait_titles = [
            "Won't Believe",
            "Secret",
            "Top [0-9*]",
            "Guess"
        ]

        click_bait_titles.each do |bait|
            if title.include? bait
                return true
            else 
                errors.add(:title, "Invalid if title has no clickbait")
            end
        end
    end

end