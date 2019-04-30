class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait_detector

  def clickbait_detector
    if !title.include? "Won't Believe"
      errors.add(:title, "can't be clickbait bullshit.")
    end
  end
end
