class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.score = 0
		@comment.save
		redirect_to show_path(@comment.yak_id)
	end

	private
		def comment_params
			params.require(:comment).permit(:body, :yak_id)
		end
end
