class User < ActiveRecord::Base
	has_many :yaks
	acts_as_voter
end
