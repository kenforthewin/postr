class Comment < ActiveRecord::Base
	belongs_to :yak
	acts_as_votable
end
