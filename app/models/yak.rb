class Yak < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	acts_as_votable
	self.per_page = 10
end