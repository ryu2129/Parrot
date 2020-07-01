class CommentsController < ApplicationController

  def create
    @post =Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.member_id = current_member.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :member_id)
  end

end
