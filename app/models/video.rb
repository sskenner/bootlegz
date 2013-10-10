class Video < ActiveRecord::Base
  has_many :video_categories
  has_many :categories, through: :video_categories, order: :name

  validates_presence_of :title, :description
  #validates :title, presence: true
  #validates :description, presence: true
end
