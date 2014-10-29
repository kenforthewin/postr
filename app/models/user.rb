class User < ActiveRecord::Base
	has_many :yaks
	acts_as_voter

	validates :body, presence: true
end
