class Category < ActiveRecord::Base

	extend FriendlyId
friendly_id :slug, use: [:slugged, :history]

has_many :articles
end
