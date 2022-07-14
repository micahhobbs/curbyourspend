class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @item = Item.find(params[:item_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.item = Item.find(params[:item_id])
    @comment.save
    redirect_to item_path(@comment.item_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to item_path(@comment.item_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
