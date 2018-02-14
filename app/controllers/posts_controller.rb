class PostsController < ActionController::Base

  def show
    @post = Post.find(params[:id])
    @answers = @post.answers
    @new_answer = @post.answers.new
  end
end
