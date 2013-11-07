class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, order: "created_at DESC"

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def average_rating
    if self.reviews.count > 0
      total_rating = 0
      self.reviews.each do |review|
        total_rating += review.rating
      end
      average = total_rating.to_f / self.reviews.count
      return average.round(1)
    end
    return 0
  end
end
