# コメントを即時更新・表示させる機能に必要性を感じなかったため、未実装。学習用の記述。

class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
