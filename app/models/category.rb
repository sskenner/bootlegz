class Category < ActiveRecord::Base
  has_many :videos, order: :title
  #has_many :video_categories
  #has_many :videos, through: :video_categories, order: :title
end
