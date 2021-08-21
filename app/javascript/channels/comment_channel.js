// コメントを即時更新・表示させる機能に必要性を感じなかったため、未実装。学習用の記述。
import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const htmlUserName = `<p>${data.user.nickname}</p>`
    const htmlCommentText = `<p>${data.content.text}</p>`;
    const userName = document.getElementById('user_name');
    const comments = document.getElementById('comment');
    const newComment = document.getElementById('comment_text');
    userName.classList.add("user-name");
    comments.classList.add("comment");
    userName.insertAdjacentHTML('afterbegin', htmlUserName);
    comments.insertAdjacentHTML(`afterbegin`, htmlCommentText);
    newComment.value='';
  }
});
