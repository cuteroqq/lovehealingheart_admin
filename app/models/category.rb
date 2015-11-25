class Category < ActiveRecord::Base
  has_many :event_categories, :dependent => :delete_all
  has_many :categories, :through => :event_categories
end
