class Video < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, order: "created_at DESC"

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  # def average_rates
  #   rvs = reviews
  #   if rvs.blank?
  #     0.0
  #   else
  #     ( rvs.map( &:stars ).sum / rvs.size ).round(1)
  #   end
  # end
end
