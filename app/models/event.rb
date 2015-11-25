class Event < ActiveRecord::Base
  has_many :event_categories, ->{ order("category_id") }, :dependent => :delete_all
  has_many :categories, :through => :event_categories
end
