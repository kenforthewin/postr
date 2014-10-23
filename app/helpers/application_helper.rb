module ApplicationHelper

	def get_current_user
		if !cookies[:user_identifier].nil?
			@user = User.find_by_identifier( cookies[:user_identifier])
			if @user.nil?
				create_user
			else
				@user
			end
		else
			create_user
		end
	end

	def create_user
		@user = User.new
		@user.identifier = generate_token
		@user.save
		cookies[:user_identifier] = @user.identifier
		@user
	end

	def generate_token
    loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(identifier: random_token)
    end
  end
end
