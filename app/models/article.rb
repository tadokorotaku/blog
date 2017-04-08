class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  extend FriendlyId
  friendly_id :slug, use: [:slugged, :history]
  
end
