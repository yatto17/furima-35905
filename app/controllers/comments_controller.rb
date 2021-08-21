class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:item_id])
      # 以下、コメントを即時更新・表示させる機能に必要性を感じなかったため、未実装。学習用の記述。
      # @user = User.find(current_user.id)
      # ActionCable.server.broadcast 'comment_channel', content: @comment, user: @user
    end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
